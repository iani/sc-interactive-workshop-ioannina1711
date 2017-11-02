ServerBoot add: {
	var files, buffers;
	/*
		Platform.userAppSupportDir.postln;
		files = (Platform.userAppSupportDir ++ "/sounds/\*").pathMatch.postln;
	*/
	files = (Platform.userAppSupportDir ++ "/sounds/\*").pathMatch;
	buffers = files collect: { | f |
		Buffer.read(Server.default, f);
	};
	buffers do: { | buffer |
		Registry.put(\buffers, PathName(buffer.path).fileNameWithoutExtension.asSymbol, buffer);
	}
};

Server.default.boot;