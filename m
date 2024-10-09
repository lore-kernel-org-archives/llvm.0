Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B6918E35D;
	Wed,  9 Oct 2024 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473436; cv=none; b=KeiKPvkM18UKfolGMCsEGAFaTcqNnltS2ckQL8QEDIEJpTE8qcyVL7hgrw7YITBSLSMFaZ/kmPZ+eUlw01kfd8/dtEMeVUp3mucHu4RpX79m21+xcV3hL/5iXTsHBHZkQd7wAliF1aX8ynWBTV0XWwM2IVEYYZzoS68FB2Np8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473436; c=relaxed/simple;
	bh=D1sqewVjz6IFENApFE2c7DXsTbWoVFgfGxLY7tla97M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/ectuxrx3lseBrs2rsKiaGiUfk27NcypqqPV0YCfAaiDY9DdG6tDoHlsv/9BV/w/i+7YzEIFWYKYqAeYJ7FIezEWGGhi8kiQuRqeUGjJCF649nrEVxUKpaEvBZmDkpnKET3ohQDGamGoMHhYN3OFq0mwesKoivP14v0iJmIjyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sYRNshqs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1ZvXhEXX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sYRNshqs; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1ZvXhEXX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sYRNshqs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1ZvXhEXX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sYRNshqs";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1ZvXhEXX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 970221FE92;
	Wed,  9 Oct 2024 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728473432;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cM/SsMaJcLp6K4q/O+Tz8RBKsrQ2pN/3uLoll3Tr6c=;
	b=sYRNshqsNEIxP0heqEFrQYL0h/8GGlV3ubvLSwNdxFtRM4+tOYHt9DGlF3+9NeXHZh+fqb
	t8PRWdE/JHlrcMrHPW+jxGWWX4Lyn+m/9tPdXH2EqThgQbX7wAk6nSlZ1Le9oFg51PBKzy
	17VvHUXToGj81ztQHEUUwEBBxlxTp3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728473432;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cM/SsMaJcLp6K4q/O+Tz8RBKsrQ2pN/3uLoll3Tr6c=;
	b=1ZvXhEXXhOxaPvv3EcPgSXCW0NVPTvkoq83VRahwF8WfO+F9m4W+cL/MuVGVuEPiajLvN4
	jJU8RWJHQN0h4XBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=sYRNshqs;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=1ZvXhEXX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728473432;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cM/SsMaJcLp6K4q/O+Tz8RBKsrQ2pN/3uLoll3Tr6c=;
	b=sYRNshqsNEIxP0heqEFrQYL0h/8GGlV3ubvLSwNdxFtRM4+tOYHt9DGlF3+9NeXHZh+fqb
	t8PRWdE/JHlrcMrHPW+jxGWWX4Lyn+m/9tPdXH2EqThgQbX7wAk6nSlZ1Le9oFg51PBKzy
	17VvHUXToGj81ztQHEUUwEBBxlxTp3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728473432;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cM/SsMaJcLp6K4q/O+Tz8RBKsrQ2pN/3uLoll3Tr6c=;
	b=1ZvXhEXXhOxaPvv3EcPgSXCW0NVPTvkoq83VRahwF8WfO+F9m4W+cL/MuVGVuEPiajLvN4
	jJU8RWJHQN0h4XBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EAAC13A58;
	Wed,  9 Oct 2024 11:30:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lL+AGlhpBmf1CAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 09 Oct 2024 11:30:32 +0000
Date: Wed, 9 Oct 2024 13:30:30 +0200
From: David Sterba <dsterba@suse.cz>
To: Filipe Manana <fdmanana@suse.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Subject: Re: [linux-next:pending-fixes 207/319] fs/btrfs/qgroup.c:2014:6:
 error: use of undeclared identifier 'bytenr'
Message-ID: <20241009113029.GJ1609@suse.cz>
Reply-To: dsterba@suse.cz
References: <202410091038.SI34ZULQ-lkp@intel.com>
 <CAKisOQHVBRbpsDnWRa40Rga1hjW_5xuwPAshXY=6+nNb6O8OOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKisOQHVBRbpsDnWRa40Rga1hjW_5xuwPAshXY=6+nNb6O8OOg@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: 970221FE92
X-Spam-Level: 
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.21
X-Spam-Flag: NO

On Wed, Oct 09, 2024 at 11:09:13AM +0100, Filipe Manana wrote:
> On Wed, Oct 9, 2024 at 3:55 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
> > head:   47fa0de9b07c6214b57458e965646a3e25656b69
> > commit: 5c0ea18d992fffc948e087c0002560d747e6edd9 [207/319] btrfs: use sector numbers as keys for the dirty extents xarray
> > config: arm-randconfig-002-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091038.SI34ZULQ-lkp@intel.com/config)
> > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091038.SI34ZULQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410091038.SI34ZULQ-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> fs/btrfs/qgroup.c:2014:6: error: use of undeclared identifier 'bytenr'
> >            if (bytenr >= MAX_LFS_FILESIZE) {
> 
> Ah this should be record->bytenr.
> The issue is actually fixed in a later patch of the same patchset,
> where bytenr is a function argument.
> 
> I can update the patch but then it will require updating the patches
> that come next from the same patchset and rebasing the for-next
> branch.
> And I see it's already in the next-fixes branch.
> 
> David, how do you prefer to proceed here? Do you want me to fix this
> and resend the patchset?

No need to resend, I'll fix it locally, the patch in next-fixes was the
old one so I'll sync it with what's in our development for-next (and
also check the others just in case).  I'll also check and update all the
branches involved in the for-next pulled by linux-next.
