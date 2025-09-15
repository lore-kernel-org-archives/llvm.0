Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6397727FD72
	for <llvm@lists.linux.dev>; Mon, 15 Sep 2025 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917222; cv=none; b=BARywwP2u+92grXothr34UY+2lGnQulA3jTmYGIdwU8siWFPsyR5DGz9bgMws7nAXKWOeaSLJqw5lH4STpHSx/xiIGpWsa259W23PFN9KG5opIqxLU9xv+XaKg9pnuzJAhGO7g5ZIfPtmr+Ox0jGfEY59RzwFeTdLQLVV92lsd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917222; c=relaxed/simple;
	bh=vva6pIwIf3d2mZtlJF6HKg5UB//x7948Lc30IK2Mdek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Lpsluk1OfKGhh7JTXDysP9GuaFYEnFTcJS7QR2Z61JlVhNFYsZoANs7uOzFeLI8Jp0UNMpWs6cuSyFoWYWBUMI6LwahNwY5EDF/fjzfW/LrY7771q/yCuVM7uRwzok71eJGCfgosJVRQYB3MDGn5xbNFOv02tABQ0HQhA+X+CSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yzcd9xEi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yzcd9xEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757917218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cBtHKBe6RRB8Snk7hpO1mjWCGkijKsQ31tvgy2vEzE=;
	b=Yzcd9xEigLlF1icPMpWNppJxieILpUVC9lhEZiHMWjnAKS8TqoFmfsbiiBEGSSoWTwHdSW
	yhRC+oBZUgLvE19XhV2/zNjSLYoZ7nRVjWelFgQr+/AkqOFbS/+mK7GnbWqhxjlms0blma
	jpGK1csvP7gHTuq/4l5m4YkFix9QryY=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-IfO0qBSaO2y5MbwabEHbeg-1; Mon, 15 Sep 2025 02:20:15 -0400
X-MC-Unique: IfO0qBSaO2y5MbwabEHbeg-1
X-Mimecast-MFC-AGG-ID: IfO0qBSaO2y5MbwabEHbeg_1757917214
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77618a8212cso2184466b3a.1
        for <llvm@lists.linux.dev>; Sun, 14 Sep 2025 23:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757917214; x=1758522014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cBtHKBe6RRB8Snk7hpO1mjWCGkijKsQ31tvgy2vEzE=;
        b=ICzV3vDLe4npqYMW37wSIFFiy7LA50byBCKFANxjiRDVTXuJPQXHGPLGjiAsWdtzkb
         bVi58f28lk4L+yyEfUaOYswPOfltABkCWYWqEHCC+1hNruC8SAHsrYT2FKn6+c9PSD5k
         IT4sZSRS34Ma0LIUxrW/hLiXFvgQ+Z5KlNbtVoXNgMuXG5gxBnVpEohsSGLV31kiy4ej
         d9v+nLOk+DP/rIdgbudIGfRja5D2Nk5Ozm97lplcX2BFhrojqV8V7tI07F0letDWwSig
         eJPW3+HkpHDZAxLzTraZfEbzPZQ7Y4p+QlOnuqO3T84MmdTWGNVJDxwzW3pOYbhmM+F6
         v1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOtod08Arlv6lOk/xxau/pqy1sbVmpFM4ClGSeUMlVx3SGFGltVn94bdiCSmkhkBThPcN@lists.linux.dev
X-Gm-Message-State: AOJu0YyM1OLfLBm0hzanIKV8uwhfxhIU41nGkdarOJQZJS/3HJBjIezf
	8aw14ORi4+/jn17OpUiQhnqBMRAkHHfRBkuWtCpapF5uLCQ0oUON4Rxk1OLd/sRZ9u3Tf8oRLlN
	VNINUQtBEdQCgNNJrs87I1657FWfiEtarnyoGmy/sg6Ht40VzpznnLQQ=
X-Gm-Gg: ASbGncvdWC5aqclK2XnrMCBVXY1nxG6raRfQyQ1DZFBk5hwzDVwm1OmUXAF9kZo9R7D
	GWRjooMBn9TM4mBGIA+BwDfbpsrWOxURY+3IKx3po1WNo3wt725RIFENDe6ybh6ivnkknLZLxZz
	l0Et61AMVG37ZyuEeMZy3KchDzXzBiNE/GBLG9dYB1z4lP7SzcW932kYed9zBElewyTkxTGH30a
	PgMoZekXHZzenEJiFXCmfhqFhabgKqx0bxg5fOr3kSIqAFmKmCAagYvWUn2ahsvoSjpEvH0JhKn
	v12SgbJ4AR9eI4rc7WN8i4Rgfc0yWUo=
X-Received: by 2002:a05:6a20:7d86:b0:243:b92d:72c1 with SMTP id adf61e73a8af0-25cdefc7abbmr21753630637.0.1757917214008;
        Sun, 14 Sep 2025 23:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErivlYOqYNMD1uzOOLvIYOeSFyGjheTCp4Vv8Fmhsfn/ts4DA9nnO0VA6qrA0q8hxFLJc/yg==
X-Received: by 2002:a05:6a20:7d86:b0:243:b92d:72c1 with SMTP id adf61e73a8af0-25cdefc7abbmr21753609637.0.1757917213616;
        Sun, 14 Sep 2025 23:20:13 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b169f2edsm7546506a12.19.2025.09.14.23.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 23:20:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:17:51 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, fuqiang wang <fuqiang.wang@easystack.cn>, x86@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] crash: Add KUnit tests for crash_exclude_mem_range
Message-ID: <x33mpzp6bhnx2awnszjymuyfhgmtvq5hhfs6aoyvuoo6opsbqr@tkegmqv3lucp>
References: <20250904093855.1180154-2-coxu@redhat.com>
 <202509090415.cOytgte4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202509090415.cOytgte4-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YHOTaVyal5BnjhqsONkywDGPqiW7XC3KRDX16-i-HAE_1757917214
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Sep 09, 2025 at 05:25:17AM +0800, kernel test robot wrote:
>Hi Coiby,

Hi,

>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on b320789d6883cc00ac78ce83bccbfe7ed58afcf0]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/crash-Add-KUnit-tests-for-crash_exclude_mem_range/20250904-174105
>base:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
>patch link:    https://lore.kernel.org/r/20250904093855.1180154-2-coxu%40redhat.com
>patch subject: [PATCH v6 2/2] crash: Add KUnit tests for crash_exclude_mem_range
>config: x86_64-randconfig-073-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090415.cOytgte4-lkp@intel.com/config)
>compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090415.cOytgte4-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202509090415.cOytgte4-lkp@intel.com/
>
>All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "crash_exclude_mem_range" [kernel/crash_core_test.ko] undefined!

Thanks for reporting this problem. This issue has already been fixed by
Andrew [1][2] earlier.

This issue happens because the KUnit tests can be built and run as a
kernel module. 

[1] https://lore.kernel.org/mm-commits/20250905031921.E0A26C4CEF0@smtp.kernel.org/
[2] https://lore.kernel.org/mm-commits/20250914001748.77104C4CEEB@smtp.kernel.org/

>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
>

-- 
Best regards,
Coiby

