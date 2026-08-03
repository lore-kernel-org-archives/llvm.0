Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8FAB672
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 04:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785732938; cv=none; b=OE4wSSWu5LO2ODx7KVd8K6mTFdNPfCwAOJb6pzyISmsM0sG1SVdjAoX/kJiw/j/KSlyan0JvYNzwPlX/kULgP7nxhbkf+J/fJaSReh94A+ZZKAvf8u5HLrKSvro9qrBcw3WP4BsMrZFw36M37HGNFjBSuXFJrMrSNC8U/9Ymbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785732938; c=relaxed/simple;
	bh=fRJj015EwMjGldfpjrYNn5WsphdExP9SmZFsg+szH3w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMQiBszORGtNkPbGWvYl4JS9xAzANtiPpxUDcibpBKf9aloBQuZlvOkhIt+mW/Q1pP57tCKWl6gCXeLKrJ/v7aKiqjH92c5dJRKZKMN94uM5PKkajza17XYjBfFNSKUd24z2ucbEhtltmWmVfYssvixwM7o0ESt226YxKWhrjb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qHlVhtJt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dGBQYC5d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QF6K++kc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DF+YIjls; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qHlVhtJt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dGBQYC5d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QF6K++kc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DF+YIjls"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 09E2D7EE96;
	Mon,  3 Aug 2026 04:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785732924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JL687k9UJ80Ji/EnHGuBbxZo/4lxjPoihzqXv/O2HDA=;
	b=qHlVhtJt1i6irEG2tm1eAtGfS/UDVSPhpplsJVni2OfaolXcfX3fmkyE9bjn/K7mXwNMaC
	hy4/jKVYit8YaPPVj6Y7HGNeVZNRI0wOMxXDPZW2pvY9tHmY8ujoK0O6rG7dzrLCZ1Gjy5
	ZCCB+e1h5dgpANpxyfEVPS3/pAVJbpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785732924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JL687k9UJ80Ji/EnHGuBbxZo/4lxjPoihzqXv/O2HDA=;
	b=dGBQYC5dvy8R9qfKXSYLkAtuitEcFr1e/VfzB3S6P4n6p98wwkGfT6FVdwviV2I9JkUEim
	mhIw/CBICqnY+MCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785732920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JL687k9UJ80Ji/EnHGuBbxZo/4lxjPoihzqXv/O2HDA=;
	b=QF6K++kcUBc4kdPJlyunEQlF72aucwsB/5oHl6fGGpn6Y4/GQPOz9zjgot2vO8Uimpf0Sy
	+oR0Ia5qPMRu+DJyjLd6EmmXBVnqWtWKIEo9cSERpl2xamQBN70wzeOAXGiDezYQl1kQZz
	4wd+/2lndktrbYNeYqzNrHQvmCZUgaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785732920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JL687k9UJ80Ji/EnHGuBbxZo/4lxjPoihzqXv/O2HDA=;
	b=DF+YIjlssn6ttnTEVtJvrW6pQ3PDQsV55YN8HOVvg0N9kZDXN16+iurz0ZOEcAwEWo2wSo
	s1gf1tN+5Yu3hwAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BFE9779A1;
	Mon,  3 Aug 2026 04:55:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ruCVATYfcGrFEAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Mon, 03 Aug 2026 04:55:18 +0000
Date: Mon, 3 Aug 2026 14:55:12 +1000
From: David Disseldorp <ddiss@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Christian Brauner
 <brauner@kernel.org>
Subject: Re: [linux-next:master 11199/11507] init/initramfs_test.c:580:15:
 error: call to undeclared function '__override_init_fs'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <20260803145512.6b2e6c18.ddiss@suse.de>
In-Reply-To: <202608010904.q5YsN4ye-lkp@intel.com>
References: <202608010904.q5YsN4ye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[intel.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,intel.com:email]

Thanks for the report.

The vfs-7.3.misc commit da46f0e1053c9 ("initramfs_test: use test
init/exit hooks to override init fs") is bogus: it is supposed to be
applied / squashed atop Christian's ("kunit: use scoped_with_init_fs()
in tests that resolve paths") change, which includes fs_struct.h .

Christian's vfs-7.3.kthread branch has a correctly squashed version as:
b4343aebd3a4d ("initramfs_test: use test init/exit hooks to override
init fs").

@Christian: could you pleasee fix or drop the bogus da46f0e1053c9
vfs-7.3.misc commit?

Cheers, David

On Sat, 01 Aug 2026 10:26:10 +0800, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   415606a7be939835db9b0d6b711887586646346d
> commit: da46f0e1053c98355c2d7803ff1cc46617ca81bf [11199/11507] initramfs_test: use test init/exit hooks to override init fs
> config: arm64-randconfig-001-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010904.q5YsN4ye-lkp@intel.com/config)
> compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010904.q5YsN4ye-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608010904.q5YsN4ye-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 415606a7be939835db9b0d6b711887586646346d builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> init/initramfs_test.c:580:15: error: call to undeclared function '__override_init_fs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]  
>      580 |         test->priv = __override_init_fs();
>          |                      ^
> >> init/initramfs_test.c:580:13: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]  
>      580 |         test->priv = __override_init_fs();
>          |                    ^ ~~~~~~~~~~~~~~~~~~~~
> >> init/initramfs_test.c:586:2: error: call to undeclared function '__revert_init_fs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]  
>      586 |         __revert_init_fs(test->priv);
>          |         ^
>    3 errors generated.
> 
> 
> vim +/__override_init_fs +580 init/initramfs_test.c
> 
>    576	
>    577	/* Tests run in a nullfs kthread; always use the init fs for path resolution. */
>    578	static int __init initramfs_test_init(struct kunit *test)
>    579	{
>  > 580		test->priv = __override_init_fs();  
>    581		return 0;
>    582	}
>    583	
>    584	static void __init initramfs_test_exit(struct kunit *test)
>    585	{
>  > 586		__revert_init_fs(test->priv);  
>    587	}
>    588	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

