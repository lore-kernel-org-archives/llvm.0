Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91761365;
	Tue, 20 Dec 2022 22:40:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84B4C4DDCA;
	Tue, 20 Dec 2022 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1671576034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaMjbYXCAB1pbi4N+U+NGehF3r5cVCO6SVyTsmpw7ww=;
	b=V42YAehYBCywNM1UQufySKDLW1mVDe7l8mqGWFTRbnlsnKLAST+9UHBh6ENJ22ooblCPHT
	gaBEHh+UsnUG+cq5p10QzjWZF7WxGv70IkGPIXMTVGjNrJKy3layqgUP+9cZHUUbiQUUFn
	K/eH+JKW0gsOgmF+YQ6R1eOEvdWN3p4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1671576034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MaMjbYXCAB1pbi4N+U+NGehF3r5cVCO6SVyTsmpw7ww=;
	b=NvRTujoIjo3aqzAgklxOHfa0hgQf7TvHBWnrNNCvuy69aOVIBZBmvmHalDGacSjDl51KII
	lEiT89QRNlOYlgCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 745ED1390E;
	Tue, 20 Dec 2022 22:40:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YSRdHOI5omNUCwAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 20 Dec 2022 22:40:34 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id ECA76A0732; Tue, 20 Dec 2022 23:40:33 +0100 (CET)
Date: Tue, 20 Dec 2022 23:40:33 +0100
From: Jan Kara <jack@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, Jan Kara <jack@suse.cz>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [jack-fs:for_next 17/20] fs/udf/namei.c:1250:12: warning: stack
 frame size (1536) exceeds limit (1024) in 'udf_rename'
Message-ID: <20221220224033.sniahpndvlswdghx@quack3>
References: <202212200558.lK9x1KW0-lkp@intel.com>
 <b41e5a55-397f-4e86-a1aa-8874114f23c7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b41e5a55-397f-4e86-a1aa-8874114f23c7@app.fastmail.com>

On Tue 20-12-22 22:26:07, Arnd Bergmann wrote:
> On Mon, Dec 19, 2022, at 22:47, kernel test robot wrote:
> > tree:   
> > https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git 
> > for_next
> > head:   288b92cc9d904b35f73c8e0b0c99592999702685
> > commit: e4fefb466e1317384788946a1b81b577e8e730b9 [17/20] udf: Convert 
> > udf_rename() to new directory iteration code
> > config: arm-randconfig-r046-20221218
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 
> > 98b13979fb05f3ed288a900deb843e7b27589e58)
> > reproduce (this is a W=1 build):
> 
> I see this as well, the problem is clearly the three instances of
> struct udf_fileident_iter on the stack, each of them containing
> a 256 character string along with ~100 bytes of other data.

Yep, I'm testing a patch that moves the 256-byte buffer to kmalloc() area
to reduce the stack usage...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
