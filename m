Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6B19470
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714763214; cv=none; b=QY9y9rrNFV6//iuhLr9hlzhQBJ9Fve4WXbrIUIoU1hQ9CUsrC+sCwqSlFEJA1SIi2MDIw/dEpJ5A7avwacpNhlMh/Jilaag9AFuZajBB0TeOKIRl9kwQDxJhY+DVaCcodGjYE+KbbZES6+2Y1+G1viu1yYB10QXlXT/7OZ+HK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714763214; c=relaxed/simple;
	bh=3fMQGIHvCxuh/KI+QGtnXkUw9u+MmF/lvsQK73wS5lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agdt4jaHYtOX1p4OBJRFakYMfO+wuUs4fZk/s377WMM2pDRhUUzWMsXkRY9adRysQXQp9V5Ou4O7MmdctEToa+XzBrLjOuPbh/PMKJ9QtqdJZHfrkvFEdOTq0hjiKL6qTO3QBSoHYIkB0NaLQXfLAe/jcNQ+J9k2FvSivuisZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=No0FUqf4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="No0FUqf4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ed012c1afbso202585ad.1
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714763212; x=1715368012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcmBSm5zJ4Ky10rROpSv6jdG1exUyb1cNnY853+P3xQ=;
        b=No0FUqf4xDDRwNo/h/7Q0NAOhneIZXGF3NeE9GYwjV57QZkTvgPgSEVYnLUrFTA/vE
         A7NFZewcdz8Z3rf/d4zVNvtYa+C/teSErSMpM0ZszNevLVkcb0YsnOMjIvDDZqooZDzG
         cCPlz4EyMr5Dbjo94jKmT6QjIBL6BHXb5YyZz0qKBFoRmlcL2WqDbCqu3ZxiiErnSxvO
         Qvq1hprPo/wuhIw0NYHVfUDbLryDugZKeaTkeOixempaZSnN/5TVr17y+CTWVVSSVTKV
         jV38YDCUgzpUZ4drKgUmQoxEnu21Z54e04btnOXsKJAcRwpyi/lAoztuiDntGMqZJLPw
         IDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714763212; x=1715368012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcmBSm5zJ4Ky10rROpSv6jdG1exUyb1cNnY853+P3xQ=;
        b=vJY8HvSSC95bUEvVCYd2tOiI5LuOc0klUXhvLscMIFB4hcp5j2PfVuoftCu1p6dOlc
         ojk6RfgP4gpDmC2pzpJlOrd4Pwd++l3Ib8JDhEt7ulEfwk1s6CsXzphileykKGHdxAt5
         SxORwUVZDZFU7TR/35ezaYRFLG97g8uHkIpCVnmr/1ckzRLTUXxLaHTDTE5KA/Az5CtA
         xCcgjloNPrrlcCCtGxst1Ja2KG1DhLK1ETq7gP4azVX+iVwegG4H1OUnZFpix6oMqdq9
         ooAuFcRyAz22ytu3sjIBLnr9BF4lfUcPlfvsNk3zJQYgeyzQYt/OTjpfkvJaECYMCX77
         mZGA==
X-Forwarded-Encrypted: i=1; AJvYcCUesJE5fEZrd3Me2oCCcGzhw4L6C9zN98dBvmWJ3kzr1G3Og5VvYUDjihtTfDqAhf0UYlre+LKcP7sWVm4CUtEF/08W7g==
X-Gm-Message-State: AOJu0YwBaKsCHjTRR/3MHG31ACaWxL1gLmEkaL/pdJM+PwjotLRAeQp/
	JdA/wGCLSjtHnLKq4PC+Vyca+XfbRhDb9VBAyCdbT0epjjyF05WE
X-Google-Smtp-Source: AGHT+IFg6GGVyu95XtXhoIqjH+6iNScaK7UWQsRzeKPiKvgKFmZuo0v+/xZaWfl1gbkOvDC7TZ4nqw==
X-Received: by 2002:a17:902:e885:b0:1e2:45f3:2d57 with SMTP id w5-20020a170902e88500b001e245f32d57mr5255562plg.6.1714763212311;
        Fri, 03 May 2024 12:06:52 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id jw19-20020a170903279300b001eab3ba8ccfsm3587280plb.285.2024.05.03.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 12:06:52 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 3 May 2024 09:06:50 -1000
From: Tejun Heo <tj@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/4] selftests/cgroups: fix clang build failures, warnings
Message-ID: <ZjU1yt3zU1p60JS7@slm.duckdns.org>
References: <20240503035105.93280-1-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503035105.93280-1-jhubbard@nvidia.com>

On Thu, May 02, 2024 at 08:51:01PM -0700, John Hubbard wrote:
> Hi,
> 
> Just a bunch of fixes as part of my work to make selftests build cleanly
> with clang.
> 
> Enjoy!
> 
> thanks,
> John Hubbard
> 
> 
> John Hubbard (4):
>   selftests/cgroup: fix clang build failures for abs() calls
>   selftests/cgroup: fix clang warnings: uninitialized fd variable
>   selftests/cgroup: cpu_hogger init: use {} instead of {NULL}
>   selftests/cgroup: fix uninitialized variables in test_zswap.c

Applied to cgroup/for-6.10.

Thanks.

-- 
tejun
