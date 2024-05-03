Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717741C72
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714765844; cv=none; b=eNRuFIFNEjMXrrMO4T9OAusugFer6E4KSgsxOV3TgI/uTlCx5a/OkYXkqS2+8NZ+jeTupaS9L3ilBt/17L1R8jMaWM/7Tc7/oKEsabW619r0870v9eaP/0AKe8zFZNvRH/fPEEny/CO82h0mVjDAXytYsUGJ+KATkhBamV/Q4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714765844; c=relaxed/simple;
	bh=KN3OMp2RxTcIZRuhyPTjSWHGJjFCoqc9Q5ufOJcmQ5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEDUoLOr0zFAw0mBeThMkNqz1hHHKiz/BBGoKPqx1GVT5xugFEUZCcs2InlnZius8UfA8cW3uN5T//eXBPZzNCmPacDJe4QJu2kJQy3XS1CB6LWeC/3ng0GyMwoAu9cwg19NTgxirvM0YwC+/LqC0AszRGKYIec0QUoxeQe188Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nchAsyt1; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nchAsyt1"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6a04bae512aso264216d6.2
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714765841; x=1715370641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuVUTGivGv+RNT3apO0p2n+zz8phIuPLwQeuA6Csm8A=;
        b=nchAsyt1bipoNuOWy/kjS+f9jLN//2DvUGZLOVSQSG9vjXGFsIZ557EYlwVGcP6DV5
         vChmWs/p+wkVM+tyb+jMihauF+K++a/cJ9rD5KDiAz4hDV+XlmM9HByFAlnk9UYVRlGR
         pGmX9z0HviTZ+028WvHccSH9eScrcL71yHgHnlEh8agGGrzqxouhv7TV9b4lFoqM3peQ
         fnn3I2of6Uc4fxttpN1Evved9AYz+uS0gw8x4vW5pkTZPQ247LvkW9da+wtUGtOkbN1O
         D5g+UUB9m5IXcTAoFhedcC60DpfXoKm7dhYGlzpbNMQKuT/TNPaJ0qkK7F5uPA3Jij6M
         DmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714765841; x=1715370641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuVUTGivGv+RNT3apO0p2n+zz8phIuPLwQeuA6Csm8A=;
        b=UI6vKApG5XaYy+930l6SyA3pG0xrsIIXD0cesZakDJvDkngQPstk3P8a3Q0gkEMB74
         P177rz2yvauMsGkAoN6GYaFmY1g0PNsfs61NFmDGs/0SYYdIqz5qElNhtUlnT8+LOjjE
         b9kfAePpXkB29AO4iKr4JzuIrLRhNi4DS0DrdaQzDYBppzY17HnlMSd9hULdKHXfP52w
         hemzoNjnwtL4wFBhM/jqQDr6xiz24N9VfdFvNB4guu63zHkuQE38oksV8oSvKQo2wHIw
         Ia/W96PdvrYgsQvT54eBa9GuYj2ezi1sLDv93NyAoghXj1pwW1gGJ51p4bN9ypD9/yTo
         BGUA==
X-Forwarded-Encrypted: i=1; AJvYcCWHJ52cgLwZ9AIyUeZLcCup3m68oaSDB3GEVtus4J9xJMAQOt6MyyG3WU2/uGdjeEc/jS1PWkfkj+4r4QE4HGiPDw9sNQ==
X-Gm-Message-State: AOJu0YzPmUaWBEQqts+frJ2Wave2rrGey0x2Q3JKIt7Nz1KtxeHwuMkr
	ofr1DDdktR92AIbFqHZ8fIMIMFOnt7n9WKZcPHXqJXt13A6tUth+dt1ZiXlOb0A19/oEOS3SpCs
	fOn6UpqqPXRJdhNhg3KGmDl4zIIU=
X-Google-Smtp-Source: AGHT+IHwsKaZ7g4EJ175fFjyaFI1whbPu9tvhSXfH4HIZV0Fc9Dc2fTEfVQKadr/oY7bJDXaWRRTj2m7au4X01JgX1U=
X-Received: by 2002:a05:6214:da8:b0:6a0:cd1b:9f9f with SMTP id
 h8-20020a0562140da800b006a0cd1b9f9fmr3712807qvh.38.1714765841550; Fri, 03 May
 2024 12:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503035105.93280-1-jhubbard@nvidia.com> <20240503035105.93280-5-jhubbard@nvidia.com>
In-Reply-To: <20240503035105.93280-5-jhubbard@nvidia.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 3 May 2024 12:50:28 -0700
Message-ID: <CAKEwX=OzV+hCXwwFhnAWKvsrDq_vMaS6GaJgRn8LG_EsB80OCw@mail.gmail.com>
Subject: Re: [PATCH 4/4] selftests/cgroup: fix uninitialized variables in test_zswap.c
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Waiman Long <longman@redhat.com>, 
	Yosry Ahmed <yosryahmed@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> First of all, in order to build with clang at all, one must first apply
> Valentin Obst's build fix for LLVM [1]. Once that is done, then when
> building with clang, via:
>
>     make LLVM=3D1 -C tools/testing/selftests
>
> ...clang finds and warning about some uninitialized variables. Fix these
> by initializing them.
>
> [1] https://lore.kernel.org/all/20240329-selftests-libmk-llvm-rfc-v1-1-2f=
9ed7d1c49f@valentinobst.de/
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> ---
