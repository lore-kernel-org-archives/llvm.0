Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8C3B9608
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088505; cv=pass; b=Lgk6gR9kYibKj7f5zs6ura4w50LBnQlSp9VGTcj171qOWxxzQdAUgKr2BjeZatiC9KySQ1a5zg6XJzeSnjCrqYmoh48CWgDjc7F4mlsKUqn1UI94Cy91Oq51b5QarcZxnlhPLf/teowdpIVOIXnPDJl5ByARpfpwoA1QbW2vXSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088505; c=relaxed/simple;
	bh=dyTd1zq5r9rUMR4f8hOsE0/w3mL0WNwp3sv5d+6zRoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTQMiqQaQEXGW90TJY1XRYV5bLFL04IVjqAsg4mSRfWnv75DHpaXTMujsEY6jzzMNeyASznr1Rdp+JailREBcUrqo7FGDNETXAK662rNHXUWSjlf4TXJLrvo5/7Szg1YXlwJhx1amYIbPkThQnQ4wSmDhZTO+oTwy4tE07+yDwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L8AH4Pa7; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L8AH4Pa7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45562c41ec7so980380f8f.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 00:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779088502; cv=none;
        d=google.com; s=arc-20240605;
        b=D0D6oezHIXYLonhS5hG6AORiVwMhetVvwUoV2KOHORFArd3H4m1ZJKq+1/s6WJNwFu
         bf9tlD2F/eaUHNCh9XCUvWw2iol9VdJE0n3PFpOCpT8SpmLHRunqPNa2dRqEmPlk1eGM
         itfVSz+1LmsdOy3BZ+biINda0dFfkf0gGz1lWNDWaMAgppx+UZT9E2EI3INVmg8y3TQh
         jjMSis7fF8Y7RISIvXh1S69EvnvGGSZLa7QqqMXUNVFDnLKpSsyCWB5vcdE1ez65rOoO
         13VtM/s2D1m1SpWAUY5tyLCkBfznmZBF+5IcyAOHLMpX12DQvzCAkYlhPhxq/zYkOjUr
         IsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AIk3YvXW7H+gMmmPuJQZLkAXdjsYSzjI9nXJFsHO2iY=;
        fh=2mW4smx7tSVrMlOyiKEStptIQUUlA0D3SNUuXCNYTAY=;
        b=dspIMm2LYWkwBoUdr6Co8uO4dFqOwB8dIGBWnnxMQtNrDGV2Rqtx0/hywKjyp2YsTH
         EvM7I+b3Fv9qvt8k0N0d2MCsBhplrlJ8fFnAoNv07nFGjdY8+L/7p3oMOVx1HUUDH13W
         FBf2utS1wxm/H3BEtBwFFoTzmE70pxIOaYhv4EBs86T1vY1dWSZkM2KDnmVh3gmE5fMx
         puQWhOs+xjgwqL1NLpG0R6bYr5pPefKcSURpZYTKEfioSoPU/H93is+rgYCzcaW0INfJ
         KjyFWMO4to5uW+w4HK+k51600+pONuancFlwQXoNNMUEA+gR02+/Bwm9KhXKNf16m+Lc
         p3tA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779088502; x=1779693302; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AIk3YvXW7H+gMmmPuJQZLkAXdjsYSzjI9nXJFsHO2iY=;
        b=L8AH4Pa7XXMhyP0DZu/L8/OKP7GhBYWr10yvHGWrrH0dEyM/FxbxZ+nmkUUmxHNklM
         RLqVSpJxlNTs5o0cn+og8EKE7hmsQnWozN/juDrg4gpGta2np5QKb48UuAQpSB2bJm6d
         vyU9oGiSMMflI5QuHJGkWc+RHY28EzXGowvmdWHCN2ckGEo+LCi6Sd2Dm+8hln/70M+4
         zj+K/B7rBS5Am8hdxtuT4WSdiDixYI1mzlGShyRg/Z9/ex894vsUTxuR37bpQXCQd9p8
         P9vDt9mjji8J1m8hyl16tBfTB5jLqOfTEM+akd6EhbyHSherJmoRRWWgR1TpUuBfH+7K
         zSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088502; x=1779693302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIk3YvXW7H+gMmmPuJQZLkAXdjsYSzjI9nXJFsHO2iY=;
        b=Lju55A/IjAXWCKZ8HHirKtPukvSJ10NE3x46QlU0Z06a8GiG05EBDk9eJYvftjhHmE
         09ASqB2eGnJS3r+wrUP3Bg31a6sw8/98R3MnxRT1jWrbRSLpyrLyBdr/PpstOuwfsKzV
         W4C2xlqI1VAGja8zj1wbOT4frtRXGyZIBaEab2YpUZgfRAirj5YTaCz7wTsZmdBi2XH8
         uPU2S3fYtjc+OpSkBGwL/GJUSR0kCh68AtFpI/4D4nMVGKEvXS2hB5iE+gEaA/ewhDtG
         tqFXgew7HIXZvRSuioipt7d4YZhWawjX2oU10PKAQ64StB66mnB6tOuU5d2KOo1lmJus
         oi4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+9zL+SGTqTYedJAN0DJ5iX5CfEh821UHhetPR9ohIxYYtEKRJ78wc7grJCkFJpSNvuQQUq@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsa+OYkykBRjpqlhJRF75qEbWj1NaUY8DfX5ShC6kvkySUVJSQ
	eytKGqqF3sYV9s4w1waldFLotYnFi/ULdhpMpiCqEEEcVOy6hzT36zbQMBGwkENm2ktzB5K/vFJ
	FpVINzkTVU/gS0bfbM13eEUnx0gpbCVJcZtGWa+L8Mg==
X-Gm-Gg: Acq92OFM33V5wlfv3nLpvB6MMlu3vekNksgRIjFwhQbhMLWHo97V/Tlti3Fj3hiSE8E
	viMFONB83bJ+uZbmiahxMA66CQmQWOqpj0Us3Xz4DsuixSzvHvuQpPguZtgKDx3e3Oo60rrWf3N
	jNKuf6GYuNznF/8bpMDHlgnA5SxdoVxtyHEMw+Mw9/2vHOVJcsdSzH8YziEXHmcUwxz5ebbdyom
	QagfyLMiBAKjs3y0bQU3mdBX6jvesHVlTzP8HbJxx53q8QNHi2D5/l5F/VzeGRpge/DE66SELxM
	uqidLNyC2xr5TU9ItDVCXrH5xmtD0mba7vyU9wT7ZjIXHn6Qm+VKxIgzDP3O52wRBt3w3ZRmSLE
	oi2vDKZk=
X-Received: by 2002:a05:6000:2c09:b0:45e:73b9:fdeb with SMTP id
 ffacd0b85a97d-45e73b9fe1amr8358824f8f.8.1779088501924; Mon, 18 May 2026
 00:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140749.ueq3q2k7-lkp@intel.com> <CAPjX3FchC22U0n8Z97p2BNxeYnf7AQXp41VQUot5ZXsSSWy1Vg@mail.gmail.com>
 <20260515150116.GQ2558453@suse.cz>
In-Reply-To: <20260515150116.GQ2558453@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 18 May 2026 09:14:51 +0200
X-Gm-Features: AVHnY4LcQWLjj2lxGW0HezilloU3iWMU_pA5bzYvoXXv_xADmBiAXYO6wBAHTaE
Message-ID: <CAPjX3FdEqo6Ox44-H9wUHvFh28Hp=xv9mS5xO1mRrCPgBMwbKQ@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 34/43] fs/btrfs/super.c:659:3:
 warning: label followed by a declaration is a C23 extension
To: dsterba@suse.cz
Cc: kernel test robot <lkp@intel.com>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 17:01, David Sterba <dsterba@suse.cz> wrote:
>
> On Thu, May 14, 2026 at 05:27:36PM +0200, Daniel Vacek wrote:
> > On Thu, 14 May 2026 at 02:02, kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > > commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
> > > config: hexagon-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140749.ueq3q2k7-lkp@intel.com/config)
> > > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140749.ueq3q2k7-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140749.ueq3q2k7-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> fs/btrfs/super.c:659:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
> > >      659 |                 int ret;
> > >          |                 ^
> > >    1 warning generated.
> >
> > This only happens with CONFIG_BTRFS_DEBUG and a clang compiler. I'm
> > getting no error with gcc.
> >
> > The variable is only used in that single switch case. If we declare it
> > at the beginning of the function then without CONFIG_BTRFS_DEBUG it
> > would complain about an unused variable.
> >
> > What are your thoughts? Do we want to introduce an extra block or just
> > keep it this way?
>
> Yes add the block to case branch please, we've done it elsewhere too:
>
>         switch (...) {
>         case: {
>                 int ret;
>
>                 ret = ...
>                 break;
>         }
>         case:

Will do that. Thanks.

--nX
