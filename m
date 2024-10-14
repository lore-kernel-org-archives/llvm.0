Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B2213BC02;
	Mon, 14 Oct 2024 22:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943603; cv=none; b=cSrQzfeF6sRd7oL/pFq75YpFJ75AU+VzbaAqb55a21BD3PmpiX6gu/9gA7pQ4HLE9q6o7Nd7KAp9qjum7UqaAp3qa2njUoa3P2/M2/T9RBMf7fsCvvrByJjLk5sXjVkQHMW/StyM1n+7qLW6wbQJEGZPizsRcrVVzOCuZV54AIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943603; c=relaxed/simple;
	bh=EZGFjWUqgzzMHtQSrMpOfKThJLG8PtzV5H6tNxA6KXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDoGyWYPWEmVaZZ2kKH36Wuzrn2KYZqaB1ZjmU4gK/qOu4+z2BTfcjDVQxYrwOPyRc5WKsUcACx4xMy6eTNzVlNtV/PKJUmymhL37bWNWHw6K9kM0UcGlFUNRETv3R4U19FA/68r1TuagJj8eZR2FXsAO1VJrBrXJw955VwTbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0gukJgxN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3IjPwouf; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0gukJgxN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3IjPwouf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0gukJgxN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3IjPwouf";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0gukJgxN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3IjPwouf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 856891F7B0;
	Mon, 14 Oct 2024 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728943598;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXYy1ae4i2l5W8H+gc40HSWB7rYf7Al69VJDG7F/UPU=;
	b=0gukJgxN+HbsNL4X9mBoGyxgIjbGI1fTtGlM5/IrNPXumAw19sIF9nhw+aMCz2QYDi4S13
	TV+0OZ6Ej1AYYKTIQR2TpE7+MI7BdDYJ75crJYiGRMGbEs1+407UrxnTIv9aipktHlHTmP
	O19IyFmme2f7AkKGcatuAa0Q0MpOsEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728943598;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXYy1ae4i2l5W8H+gc40HSWB7rYf7Al69VJDG7F/UPU=;
	b=3IjPwoufJMJKuBjlZ4XgfiT8jCZbEmRo+P8u+SjZTHouSLhkno/zpoYXFPynhwy/O5bl3y
	dwtewmSa1A5xg0BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728943598;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXYy1ae4i2l5W8H+gc40HSWB7rYf7Al69VJDG7F/UPU=;
	b=0gukJgxN+HbsNL4X9mBoGyxgIjbGI1fTtGlM5/IrNPXumAw19sIF9nhw+aMCz2QYDi4S13
	TV+0OZ6Ej1AYYKTIQR2TpE7+MI7BdDYJ75crJYiGRMGbEs1+407UrxnTIv9aipktHlHTmP
	O19IyFmme2f7AkKGcatuAa0Q0MpOsEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728943598;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXYy1ae4i2l5W8H+gc40HSWB7rYf7Al69VJDG7F/UPU=;
	b=3IjPwoufJMJKuBjlZ4XgfiT8jCZbEmRo+P8u+SjZTHouSLhkno/zpoYXFPynhwy/O5bl3y
	dwtewmSa1A5xg0BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 563AB13A51;
	Mon, 14 Oct 2024 22:06:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MniSFO6VDWfZawAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Mon, 14 Oct 2024 22:06:38 +0000
Date: Tue, 15 Oct 2024 00:06:37 +0200
From: David Sterba <dsterba@suse.cz>
To: Filipe Manana <fdmanana@suse.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Subject: Re: [linux-next:pending-fixes 207/319] fs/btrfs/qgroup.c:2014:6:
 error: use of undeclared identifier 'bytenr'
Message-ID: <20241014220637.GF1609@suse.cz>
Reply-To: dsterba@suse.cz
References: <202410091038.SI34ZULQ-lkp@intel.com>
 <CAKisOQHVBRbpsDnWRa40Rga1hjW_5xuwPAshXY=6+nNb6O8OOg@mail.gmail.com>
 <20241009113029.GJ1609@suse.cz>
 <CAKisOQGSRdm=XurQ_Fd83c6dRsVLeg7Jbh4DRMARRHqsxHvf=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKisOQGSRdm=XurQ_Fd83c6dRsVLeg7Jbh4DRMARRHqsxHvf=w@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO

On Mon, Oct 14, 2024 at 05:26:26PM +0100, Filipe Manana wrote:
> > > David, how do you prefer to proceed here? Do you want me to fix this
> > > and resend the patchset?
> >
> > No need to resend, I'll fix it locally, the patch in next-fixes was the
> > old one so I'll sync it with what's in our development for-next (and
> > also check the others just in case).  I'll also check and update all the
> > branches involved in the for-next pulled by linux-next.
> 
> Btw, I noticed that only the 2nd patch ("btrfs: use sector numbers as
> keys for the dirty extents xarray") was updated,
> so now it doesn't break 32 bits builds anymore.
> 
> However the next patch in the series ("btrfs: qgroups: remove bytenr
> field from struct btrfs_qgroup_extent_record") wasn't updated,
> and it now breaks 32 bits builds. At the same location, it needs to
> use "bytenr" instead of "record->bytenr".

My bad, I manually tested the build combinations in the first patch only
as it went to Linus' tree. I did not get any other linux-next build
failures though.

> Do you want me to update the patches and send them to the list?
> 
> There's one more change that needs to be squashed (to that last patch)
> that triggers a use-after-free reported by syzbot, which is:
> 
> https://lore.kernel.org/linux-btrfs/02fc507b62b19be2348fc08de8b13bd7af1a440e.1728922973.git.fdmanana@suse.com/

Ok, please send it and feel free to update the patch in for-next too.
Thanks.
