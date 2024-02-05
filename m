Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E531CD0C;
	Mon,  5 Feb 2024 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139743; cv=none; b=JmsmNqtSO0WiNuq5cBRiCcJ0I3cKeEKaA2fNRL1oSPlU2Qg7c6qkq6tGloVsalIf+lc9H64jN1WvpJA6gaQCYx4/DesZ5ZiMGUxDot7eI1dg2VrSGA7qdd+rEtp8CJj6otqRDEYk2AMLsq8+Ei0h1ye8/bZtyDRgoqaL33D0WqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139743; c=relaxed/simple;
	bh=WXC9/al5+TS1jYEHw6dSmxKOXsv+hkTJgFV70UB0KiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIhGZvZ8BaY7BiR2kocRDlZJtLUU9vH3mslCduKaXRjKJHXGLdKIaX7Vk627Doltjo87Ft/nJUo99wK/tH59J1c2s3r79HIkAx++6nFunI6FnusqfSYWbOFGcTCETon9f8+cyZhIlhaIpQ/rekArE7LGF1vHTZGKuJe0xQBnQDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=fail (0-bit key) header.d=marliere.net header.i=@marliere.net header.b=fQd09f8H reason="key not found in DNS"; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="fQd09f8H"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-290da27f597so2916163a91.2;
        Mon, 05 Feb 2024 05:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139741; x=1707744541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fJM73PAP4/7LnPEQFQZIBI2zMiVyyBc5s1tzET5D9Ec=;
        b=HI3q6vjtVn1ZUiI1/zMdV65VPPSEhCJvkwZLwC1SLovTAtfCZT4Dx9+Is7G5Pl7xiy
         qQ3jNSDmud/qgIvu85VRsS7fBDJt3GOyoRRsly5uCWDeElVXvxcApY9hX4ekyevE7VHo
         ViZUYajEY4+n/eQOUvXvYf0VByga5/Ta/wmoqX1YhFW5FISb8WGp5wS8uS+dQ3rW6MW7
         BRKueIBy3JHweE6N50YHfpAD9sgTCUq8yo62s3qv0jgpMgY3jzjESMNoHlQ5NvzimAhF
         eEomhtCOhzxY63r7j3VyemjDnSmRxJrLwlN6d5Mk2Ribm/293oSGH9w9jT/h6lXvgfPp
         H4CQ==
X-Gm-Message-State: AOJu0Yy5SVrKnKXAX9rR3XQr7Yprnf5aZbciRTTcM6zeGN21J7oll+nR
	Ixqm+5VaN6RjKqEVS9lPZyGIarP6zLfyQGASHdCzp2ZRnMtARNiU
X-Google-Smtp-Source: AGHT+IGdP13Y8ClIUDfR6NsnNnsCSM/aqXH+Kp3yHVkHXslfq3vVAs4mmHckjLNQdk5tWCo9lRyexw==
X-Received: by 2002:a17:90a:1f4f:b0:296:3be5:5c39 with SMTP id y15-20020a17090a1f4f00b002963be55c39mr7978961pjy.17.1707139740948;
        Mon, 05 Feb 2024 05:29:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMjEyXnlp2RtG9G/NwADeT16J79Lg1FWtZ5gfM+hUEFx1M1wzXRy7He/R98ksfTN25zCkE/j8ffu1GF6be6/RJ5cfDb7SXTfBRL63DYgPaMnBCcUTTFRxy3Vy8MyJPHRhN3MXYc9CHa4O737TrC4Wo
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id gt9-20020a17090af2c900b00296a28c0300sm1729085pjb.24.2024.02.05.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:29:00 -0800 (PST)
Date: Mon, 5 Feb 2024 10:29:30 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707139738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fJM73PAP4/7LnPEQFQZIBI2zMiVyyBc5s1tzET5D9Ec=;
	b=fQd09f8Hns9iyAQ8ESivRplouT8bzeO39u44wZdErNo5UpAC7+0Gyuu1xmfKpqCui5D0PG
	XrJfNmYXAHiqWO0/2dDCkVqGSnINKU8m0f1tS73x/Mx8Nod7JHc0L2Q7/0XHff9KgDCkyx
	n8ZIfDqP8Et/CfE1zc8VUtDQfxuLzPPt9tjxtMciqkI1gSNxn05T28WKO0/O4UhcFSio1w
	qxM6nf1gHEWzdkFKg6cx7zlQSC50VPNb/kt+uvCdd30eds57GIM8I/TuNHjUD4roQcjrxk
	MZNY52s2qSIoaKELt4m0b9sK88muaoADOf7Sb6QyG5cGerph31AlGnyU/KrfjQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Tejun Heo <tj@kernel.org>
Subject: Re: [linux-next:master 3841/4021] kernel/workqueue.c:6798:32: error:
 passing 'const struct bus_type *' to parameter of type 'struct bus_type *'
 discards qualifiers
Message-ID: <i4yenyojsqdexpr6izup472nsva4badobnz6cyc7icqaahxj7q@bwzdilmscv3c>
References: <202402051505.kM9Rr3CJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402051505.kM9Rr3CJ-lkp@intel.com>

On  5 Feb 15:15, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   23e11d0318521e8693459b0e4d23aec614b3b68b
> commit: d412ace11144aa2bf692c7cf9778351efc15c827 [3841/4021] workqueue: make wq_subsys const
> config: i386-buildonly-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051505.kM9Rr3CJ-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051505.kM9Rr3CJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402051505.kM9Rr3CJ-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 23e11d0318521e8693459b0e4d23aec614b3b68b builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/workqueue.c:6798:32: error: passing 'const struct bus_type *' to parameter of type 'struct bus_type *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>     6798 |         err = subsys_virtual_register(&wq_subsys, NULL);
>          |                                       ^~~~~~~~~~
>    include/linux/device.h:77:46: note: passing argument to parameter 'subsys' here
>       77 | int subsys_virtual_register(struct bus_type *subsys,

I'm not sure how to flag this as invalid, since this is fixed already in
32f78abe59c7 ("driver core: bus: constantify subsys_register() calls")

>          |                                              ^
>    1 error generated.
> 
> 
> vim +6798 kernel/workqueue.c
> 
> b05a79280b346e Frederic Weisbecker 2015-04-27  6792  
> 6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6793  static int __init wq_sysfs_init(void)
> 2d3854a37e8b76 Rusty Russell       2008-11-05  6794  {
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6795  	struct device *dev_root;
> b05a79280b346e Frederic Weisbecker 2015-04-27  6796  	int err;
> b05a79280b346e Frederic Weisbecker 2015-04-27  6797  
> b05a79280b346e Frederic Weisbecker 2015-04-27 @6798  	err = subsys_virtual_register(&wq_subsys, NULL);
> b05a79280b346e Frederic Weisbecker 2015-04-27  6799  	if (err)
> b05a79280b346e Frederic Weisbecker 2015-04-27  6800  		return err;
> b05a79280b346e Frederic Weisbecker 2015-04-27  6801  
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6802  	dev_root = bus_get_dev_root(&wq_subsys);
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6803  	if (dev_root) {
> fe28f631fa941f Waiman Long         2023-10-25  6804  		struct device_attribute *attr;
> fe28f631fa941f Waiman Long         2023-10-25  6805  
> fe28f631fa941f Waiman Long         2023-10-25  6806  		for (attr = wq_sysfs_cpumask_attrs; attr->attr.name; attr++) {
> fe28f631fa941f Waiman Long         2023-10-25  6807  			err = device_create_file(dev_root, attr);
> fe28f631fa941f Waiman Long         2023-10-25  6808  			if (err)
> fe28f631fa941f Waiman Long         2023-10-25  6809  				break;
> fe28f631fa941f Waiman Long         2023-10-25  6810  		}
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6811  		put_device(dev_root);
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6812  	}
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6813  	return err;
> 2d3854a37e8b76 Rusty Russell       2008-11-05  6814  }
> 6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6815  core_initcall(wq_sysfs_init);
> 2d3854a37e8b76 Rusty Russell       2008-11-05  6816  
> 
> :::::: The code at line 6798 was first introduced by commit
> :::::: b05a79280b346eb24ddb73b39988398015291075 workqueue: Create low-level unbound workqueues cpumask
> 
> :::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
> :::::: CC: Tejun Heo <tj@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
