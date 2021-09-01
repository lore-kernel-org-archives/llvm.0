Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E793FC1
	for <llvm@lists.linux.dev>; Wed,  1 Sep 2021 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630537961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VbIfjKWHJ8KB1V8GBiccCt4CfSridAvT1ZyldnMra2Q=;
	b=Iwe1I3aW7GZ0qxuGDidG4lPuX2XHM/c/8rZAW31jjrKCWcDvdqmSbSABR7L1uZITv3h4uM
	ISF3vms7uZaSJgjqGpUuE44ixROO4Zt5wtrh6C15mvxX0U0Djx2u0frKy9V9mU2DIUKjYH
	wE4ePKrQHRnK/ILeavHJA/uFAVVlOWo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-SE_ISaiJNkyd4PLbZrVrDA-1; Wed, 01 Sep 2021 19:12:39 -0400
X-MC-Unique: SE_ISaiJNkyd4PLbZrVrDA-1
Received: by mail-qk1-f199.google.com with SMTP id 21-20020a370815000000b003d5a81a4d12so82926qki.3
        for <llvm@lists.linux.dev>; Wed, 01 Sep 2021 16:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VbIfjKWHJ8KB1V8GBiccCt4CfSridAvT1ZyldnMra2Q=;
        b=MaebzyI9nmwnEmop0dvJqmSM2IO4OyFK3Fd1PdzLASXSYPjldVxTKWE7g+fjbO1mTQ
         Ne1L6zYsNMLRmtkZ7pNZtC6K0//Mdp/ro9uiAfJC8KfHit37MzSP8/f3Zj+6xUVXi1/p
         FyQGBfcEsAxQMizJXulnkzqJW66ZJrTdJiVTrOrvizusfu8RVBxT9dzCoHc2ZVi01U5G
         DYzGkM1ifZu0IkesvQ2UovxVCitS6Fr7S1zGqOz1LED8BRc1HpCNX3k4mXu9JG1cXdXp
         8aKWQpl9aYqgk0zIyRAQYkwj6U3Rlc8eTPtl2xq2W0YqwxsYdg2LKXDHaYKtljrGfqX7
         wJeQ==
X-Gm-Message-State: AOAM532C2vUq9F3KLwJoq2JCG3cxrN0VzxTlsEwGvJAvGUOJPlCZzqMh
	xPbF5ILEiLO63Aq++WLL65RiXMAE6MuwuzuewWrmWAe8VKIH9DQKjQtstSREi/xGyNNsJ1MVWRr
	PtZMFfFViOd9iPQ==
X-Received: by 2002:a05:622a:44f:: with SMTP id o15mr240158qtx.260.1630537958529;
        Wed, 01 Sep 2021 16:12:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOT/s2C/lqO1N5pj2/GH+enIBmAzz3KZmz02wac1AEISnxd7j6xiH+IWWt96jE00AuM9qZvQ==
X-Received: by 2002:a05:622a:44f:: with SMTP id o15mr240145qtx.260.1630537958310;
        Wed, 01 Sep 2021 16:12:38 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
        by smtp.gmail.com with ESMTPSA id c23sm96797qkk.50.2021.09.01.16.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:12:37 -0700 (PDT)
Date: Wed, 1 Sep 2021 19:12:36 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Lei Cao <lei.cao@stratus.com>
Subject: Re: arch/x86/kvm/../../../virt/kvm/dirty_ring.c:94:20: error: unused
 function 'kvm_dirty_gfn_invalid'
Message-ID: <YTAI5NE6MZ+J+5oM@t490s>
References: <202109020620.e6EZVLvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202109020620.e6EZVLvS-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 02, 2021 at 06:22:29AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   477f70cd2a67904e04c2c2b9bd0fa2e95222f2f6
> commit: fb04a1eddb1a65b6588a021bdc132270d5ae48bb KVM: X86: Implement ring-based dirty memory tracking
> date:   10 months ago
> config: i386-randconfig-r005-20210901 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b1fde8a2b681dad2ce0c082a5d6422caa06b0bc)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb04a1eddb1a65b6588a021bdc132270d5ae48bb
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout fb04a1eddb1a65b6588a021bdc132270d5ae48bb
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/kvm/../../../virt/kvm/dirty_ring.c:94:20: error: unused function 'kvm_dirty_gfn_invalid' [-Werror,-Wunused-function]
>    static inline bool kvm_dirty_gfn_invalid(struct kvm_dirty_gfn *gfn)
>                       ^
>    1 error generated.
> 
> 
> vim +/kvm_dirty_gfn_invalid +94 arch/x86/kvm/../../../virt/kvm/dirty_ring.c
> 
>     93	
>   > 94	static inline bool kvm_dirty_gfn_invalid(struct kvm_dirty_gfn *gfn)
>     95	{
>     96		return gfn->flags == 0;
>     97	}
>     98	

https://lore.kernel.org/lkml/20210901230904.15164-1-peterx@redhat.com

Thanks,

-- 
Peter Xu

