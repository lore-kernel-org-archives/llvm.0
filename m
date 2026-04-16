Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C22531F981
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 21:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375431; cv=none; b=rl+omEWA57jhAPPvgSS0qgnU0BjKkXVwhjSTiyCzJPKMg+euu3foBcmt/DIu+W8u3xBCFKOX1ZmYZDPp/Z58K07zf6R3CtDu64+wjgS7cQJiTOmu5HAVbbJJXbKgD3plJ4tiuabEHAx5WwuonNwTwQ5GC3zi35LGaesup9Qvya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375431; c=relaxed/simple;
	bh=LdyxjFLtCy2JeIn7eF016mTzRc4xdH1BhX+SjnX5NAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dV1WvzcR6lJWtexJ72glvZUUWRaNLty1aLOlWTBiZEw6QVFl8fdaiym8qP3gyaaCy9mbmzRcVcMkJ8v9Sjhm8vj267Py+tqhRGlHzzf8Rt7UYAnhAc9xFU0uUQAHXwwzlb3KrTrPjzw165IUMBfJzPDsVotcqGhn/mOncJlVA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h8TjBKx+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mW0IM+rB; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h8TjBKx+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mW0IM+rB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h8TjBKx+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mW0IM+rB";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h8TjBKx+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mW0IM+rB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D334B5BD2C;
	Thu, 16 Apr 2026 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1776375427;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye3JDHAihhCepJGadU03oHvkLwg7vGlrs3XwgnU2Xy8=;
	b=h8TjBKx+cN89ISF/jUvkRNqmj4TqX1Iq1MVnMfFdD6qe8BTseLN6V/aEQOgwMV7DkzHojY
	Str5S6kuJfcKRsqE8WU10SsxgfMQxL5nHmWqS5HerNYfQwIoHMM+msYOW5H2Ofy043GlFu
	8FSPEeAeVpoIfuTKkUNBxfW4lxr3JLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1776375427;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye3JDHAihhCepJGadU03oHvkLwg7vGlrs3XwgnU2Xy8=;
	b=mW0IM+rBYludQ3gUdKIuMBTPpdBVkS63qQunjWhjmrN3DiqEY3dmYuxuiQaVmjiz4fmE2C
	qSIJAgcNC0pJQvAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1776375427;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye3JDHAihhCepJGadU03oHvkLwg7vGlrs3XwgnU2Xy8=;
	b=h8TjBKx+cN89ISF/jUvkRNqmj4TqX1Iq1MVnMfFdD6qe8BTseLN6V/aEQOgwMV7DkzHojY
	Str5S6kuJfcKRsqE8WU10SsxgfMQxL5nHmWqS5HerNYfQwIoHMM+msYOW5H2Ofy043GlFu
	8FSPEeAeVpoIfuTKkUNBxfW4lxr3JLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1776375427;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye3JDHAihhCepJGadU03oHvkLwg7vGlrs3XwgnU2Xy8=;
	b=mW0IM+rBYludQ3gUdKIuMBTPpdBVkS63qQunjWhjmrN3DiqEY3dmYuxuiQaVmjiz4fmE2C
	qSIJAgcNC0pJQvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE2A3593A3;
	Thu, 16 Apr 2026 21:37:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rmFLKoNW4WkPNAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 16 Apr 2026 21:37:07 +0000
Date: Thu, 16 Apr 2026 23:37:06 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: David Sterba <dsterba@suse.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Subject: Re: [btrfs:ci-kvm-misc-next 143/160] fs/btrfs/ioctl.c:4179:6:
 warning: unused variable 'ret'
Message-ID: <20260416213706.GT12792@suse.cz>
Reply-To: dsterba@suse.cz
References: <202604162130.a7ymx66r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604162130.a7ymx66r-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO

On Thu, Apr 16, 2026 at 09:27:45PM +0200, kernel test robot wrote:
> tree:   https://github.com/btrfs/linux.git ci-kvm-misc-next
> head:   8e37b8ffd9d4e4c1e43f45dd91f5c53e19520811
> commit: ef0c33ef0f4020b31bca106645340968f1a497bb [143/160] btrfs: convert ioctl handlers to AUTO_KFREE
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260416/202604162130.a7ymx66r-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162130.a7ymx66r-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604162130.a7ymx66r-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/btrfs/ioctl.c:4179:6: warning: unused variable 'ret' [-Wunused-variable]
>     4179 |         int ret;
>          |             ^~~
>    1 warning generated.
> 
> 
> vim +/ret +4179 fs/btrfs/ioctl.c
> 
> 2eaa055fab4e31 Jeff Mahoney   2013-11-15  4175  
> 4e043cd196c85b David Sterba   2025-03-03  4176  static int _btrfs_ioctl_send(struct btrfs_root *root, void __user *argp, bool compat)
> 2351f431f72722 Josef Bacik    2017-09-27  4177  {
> ef0c33ef0f4020 David Sterba   2026-04-14  4178  	struct btrfs_ioctl_send_args AUTO_KFREE(arg);
> 2351f431f72722 Josef Bacik    2017-09-27 @4179  	int ret;
> 2351f431f72722 Josef Bacik    2017-09-27  4180  
> 2351f431f72722 Josef Bacik    2017-09-27  4181  	if (compat) {
> 2351f431f72722 Josef Bacik    2017-09-27  4182  #if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)

CONFIG_COMPAT is not defined so 'ret' is indeed not used.

> 9147b9ded499d9 Josef Bacik    2023-09-26  4183  		struct btrfs_ioctl_send_args_32 args32 = { 0 };
> 2351f431f72722 Josef Bacik    2017-09-27  4184  
> 2351f431f72722 Josef Bacik    2017-09-27  4185  		ret = copy_from_user(&args32, argp, sizeof(args32));
> 2351f431f72722 Josef Bacik    2017-09-27  4186  		if (ret)
> 2351f431f72722 Josef Bacik    2017-09-27  4187  			return -EFAULT;
> bf4afc53b77aea Linus Torvalds 2026-02-21  4188  		arg = kzalloc_obj(*arg);
> 2351f431f72722 Josef Bacik    2017-09-27  4189  		if (!arg)
> 2351f431f72722 Josef Bacik    2017-09-27  4190  			return -ENOMEM;
> 2351f431f72722 Josef Bacik    2017-09-27  4191  		arg->send_fd = args32.send_fd;
> 2351f431f72722 Josef Bacik    2017-09-27  4192  		arg->clone_sources_count = args32.clone_sources_count;
> 2351f431f72722 Josef Bacik    2017-09-27  4193  		arg->clone_sources = compat_ptr(args32.clone_sources);
> 2351f431f72722 Josef Bacik    2017-09-27  4194  		arg->parent_root = args32.parent_root;
> 2351f431f72722 Josef Bacik    2017-09-27  4195  		arg->flags = args32.flags;
> 5de0434bc06460 David Sterba   2023-11-14  4196  		arg->version = args32.version;
> 2351f431f72722 Josef Bacik    2017-09-27  4197  		memcpy(arg->reserved, args32.reserved,
> 2351f431f72722 Josef Bacik    2017-09-27  4198  		       sizeof(args32.reserved));
> 2351f431f72722 Josef Bacik    2017-09-27  4199  #else
> 2351f431f72722 Josef Bacik    2017-09-27  4200  		return -ENOTTY;
> 2351f431f72722 Josef Bacik    2017-09-27  4201  #endif
> 2351f431f72722 Josef Bacik    2017-09-27  4202  	} else {
> 2351f431f72722 Josef Bacik    2017-09-27  4203  		arg = memdup_user(argp, sizeof(*arg));
> 2351f431f72722 Josef Bacik    2017-09-27  4204  		if (IS_ERR(arg))
> 2351f431f72722 Josef Bacik    2017-09-27  4205  			return PTR_ERR(arg);
> 2351f431f72722 Josef Bacik    2017-09-27  4206  	}
> ef0c33ef0f4020 David Sterba   2026-04-14  4207  	return btrfs_ioctl_send(root, arg);
> 2351f431f72722 Josef Bacik    2017-09-27  4208  }
> 2351f431f72722 Josef Bacik    2017-09-27  4209  
> 
> :::::: The code at line 4179 was first introduced by commit
> :::::: 2351f431f727223b4d82851ee8fc045bf51edd34 btrfs: fix send ioctl on 32bit with 64bit kernel
> 
> :::::: TO: Josef Bacik <josef@toxicpanda.com>
> :::::: CC: David Sterba <dsterba@suse.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
