Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B13B585C
	for <llvm@lists.linux.dev>; Fri, 15 May 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857291; cv=none; b=JJNG9IjGpX5S5bnTOERLsUScehOFt1FG5u9Lr6pobS3qoHgqyrRpd9Z7VkGjm/hnwkKCB38qjh70zcS6nilFBnxZkeQkIxf29Py/iBIa8vQutOBYJuf52a8OOrPYoTH4GGTWB1f0EGnLCgOoEKbvNa4ezaoPIeEZesdIy7wiIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857291; c=relaxed/simple;
	bh=uiaKR9sLWFTYJwAowj+0O5FDXArQGlMC/p5UVdWMM3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klPe0TvMGzfqCCOnSN9WuIlorzQPDeXy83RcqNrFc+zGuij0l2YQ07Sa5XOWeOa8aW/6BmdqSX0bfUwVuRDhVq0qRRMqO/TmJML5A+CRXJYVIS99lCHEzg6zAuFQPUkFnlSj0TWgzHvCaFZywA3mTVSiL4QKGiVy8O0vv0Nl+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VoeTC1AL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pKZGwYmN; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uhcawfJZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=waKOJMGo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VoeTC1AL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pKZGwYmN";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uhcawfJZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="waKOJMGo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0AE606AF02;
	Fri, 15 May 2026 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1778857283;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W1xXYp7X5h3xx2goTvxVSRBGl/WUwI8ZZW7aqHTMb+Y=;
	b=VoeTC1AL6NH4NJ7J/5sO9f47rA8jHtR7DYI+V4m5dbPAPrPtdO+sIsfZgx5cJHFouOleZu
	YGsHHSegfUuPOjt7vlD/pO/TpbZwtW5OhXEnuHin+t+X9mfGuIuP7n4a3jWb+DSU/60mw+
	f7WP9FX3Gp31dPv0GqnczVf9j/G5pJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1778857283;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W1xXYp7X5h3xx2goTvxVSRBGl/WUwI8ZZW7aqHTMb+Y=;
	b=pKZGwYmNnRMu4lN1AdWgudEF3wiV+cTIuHgk3U3u7CJDyjWhaMXhSuNiWtGSmJ7tE5UvR7
	ttJznnlgxqigATAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1778857278;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W1xXYp7X5h3xx2goTvxVSRBGl/WUwI8ZZW7aqHTMb+Y=;
	b=uhcawfJZkmZRn7JXHrMANDpK82PEj1Jw963iCkiHUsUiF/jCgQPYXZFduMouLrojCPhunD
	iBjaHY3mtr/wNf477OZHsnVaiwBNeQclSdx0pHdkMs84vZs13iD6hQ6yBLpWOPVon/ysaj
	8/o1EsH8tl86uQbZbyNGUWf4dBkRM54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1778857278;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W1xXYp7X5h3xx2goTvxVSRBGl/WUwI8ZZW7aqHTMb+Y=;
	b=waKOJMGoJrSczavuIwFM0xMTTQEmOZ0nDHBtHA8TayIlKY+CQzXRkIGHlQpuZ2RyjawQcw
	po/okFlyOpV3f7Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4790593A9;
	Fri, 15 May 2026 15:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VlyPNz01B2oARwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Fri, 15 May 2026 15:01:17 +0000
Date: Fri, 15 May 2026 17:01:16 +0200
From: David Sterba <dsterba@suse.cz>
To: Daniel Vacek <neelx@suse.com>
Cc: kernel test robot <lkp@intel.com>, David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 34/43] fs/btrfs/super.c:659:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <20260515150116.GQ2558453@suse.cz>
Reply-To: dsterba@suse.cz
References: <202605140749.ueq3q2k7-lkp@intel.com>
 <CAPjX3FchC22U0n8Z97p2BNxeYnf7AQXp41VQUot5ZXsSSWy1Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPjX3FchC22U0n8Z97p2BNxeYnf7AQXp41VQUot5ZXsSSWy1Vg@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RSPAMD_URIBL_FAIL(0.00)[01.org:query timed out];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:replyto,01.org:url];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Level: 

On Thu, May 14, 2026 at 05:27:36PM +0200, Daniel Vacek wrote:
> On Thu, 14 May 2026 at 02:02, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
> > config: hexagon-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140749.ueq3q2k7-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140749.ueq3q2k7-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140749.ueq3q2k7-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> fs/btrfs/super.c:659:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
> >      659 |                 int ret;
> >          |                 ^
> >    1 warning generated.
> 
> This only happens with CONFIG_BTRFS_DEBUG and a clang compiler. I'm
> getting no error with gcc.
> 
> The variable is only used in that single switch case. If we declare it
> at the beginning of the function then without CONFIG_BTRFS_DEBUG it
> would complain about an unused variable.
> 
> What are your thoughts? Do we want to introduce an extra block or just
> keep it this way?

Yes add the block to case branch please, we've done it elsewhere too:

	switch (...) {
	case: {
		int ret;

		ret = ...
		break;
	}
	case:
