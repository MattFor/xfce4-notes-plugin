/*
 *  Notes - panel plugin for Xfce Desktop Environment
 *  Copyright (c) 2024       Arthur Demchenkov <spinal.by@gmail.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
 */

namespace Xnp {

	namespace FileUtils {

		/* UTF-8 text, or legacy text converted from the locale's charset, then Windows-1252, then Latin-1 */
		public bool read_text (File file, out string text) {
			text = "";
			uint8[] data;
			try {
				file.load_contents (null, out data, null);
			}
			catch (GLib.Error e) {
				return false;
			}

			/* A NUL byte early on means binary */
			for (int i = 0; i < int.min (data.length, 4096); i++) {
				if (data[i] == 0)
					return false;
			}

			unowned string raw = (string) data;
			if (raw.validate (data.length)) {
				text = raw.ndup (data.length);
				return true;
			}

			string charset;
			string[] charsets = { "WINDOWS-1252", "ISO-8859-1" };
			if (!GLib.get_charset (out charset))
				charsets = { charset, "WINDOWS-1252", "ISO-8859-1" };
			foreach (var from in charsets) {
				try {
					text = GLib.convert (raw, data.length, "UTF-8", from);
					return true;
				}
				catch (ConvertError e) {
				}
			}
			return false;
		}

		public bool path_exists (string path) {
			return GLib.FileUtils.test (path, FileTest.EXISTS);
		}

	}

}
