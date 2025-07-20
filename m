Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA313AD38;
	Sun, 20 Jul 2025 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752997537; cv=none; b=lIAkJaLbILdMdcT7/0OfGgvWsEUVtz6kQu60eLMcqQ3W/sk6uIDsajNY7ktpLbtxPlxtRgnoSUlFaI9/dj8JpvADopwKFnaojAhleg1xoUwKXr7jkCPzyfx5Abf8vMbduQn7GiETjcdTYtUA9UI8MJzGIEtdyYFn6k8d9zF6qS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752997537; c=relaxed/simple;
	bh=QCgEtw6goITNQUdFQJWHFRqiFOeLuB5y8mpHu+9EDJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chgdL7n6m6g9GgSZICuDFtYCtduYAbZ7NStE0gXXhqEQZZC7QeKv1AfngSTgvJiU2tmu0EQ6B7Z5eG8MLeiwbt0Z98D+d0AF68Ms1nDvHq+ZD8EQd1TgxVRghPEzwQ6DsD9EJMOoF7cCXejSEPixokEWP2AwHbFuAWmUX7bTYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUDe5wGl; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUDe5wGl"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b5931037eso25641981fa.2;
        Sun, 20 Jul 2025 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752997533; x=1753602333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6GCnhyZ97Fa9wrvzw+stGLcgjyoNyAO5PSjQNCTGfc=;
        b=OUDe5wGleypI9RKSnXR33LBI1sInnWV97Uq/Ds6RuNp4z7hiyemOzE5i4HTrF8fvqa
         wBTxSVZXWy45jHlqRHduEo7B7iw7DKxsZh7/E3EHkvAFA8KyC4INVuSEdJxNsxjUPcrj
         tBGNn22cxxUC46AJfjEf+lBLq+eyPCBvRmN2Pteg9wbAinK+GpO7c8HNJOPHLFz3frVt
         lXsxU90j6soWG2D1dV/RNU6yI7neQDkm1CyqaNg9LDO0E4qZhA5kHVMS+sIWWfhRiMEu
         kRPRhdWXgj//hc2WzehnKSPAL8ElsJ3vsFibZBAueSX6oAJtg3DpZu0YZEx9wxQEwe6V
         w3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752997533; x=1753602333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6GCnhyZ97Fa9wrvzw+stGLcgjyoNyAO5PSjQNCTGfc=;
        b=FLKXl5Ay/j/SzqT1E71cIBY3yNG5YdkXiQRdcfl5xSIGiurbkiSf/dsN5JoPlWykot
         xKR2TC716ZlN1gX1ee8yeP5f2xqgt3hAaC5dFR6npd6oDa9eS52jshAleZE4OP4g4IDN
         jrMmqOC7jPidIcoP71EfbSPxzKDyNPfs55TgJkqXWz59uyAra/EEzGYJp5MOwYE+t2KB
         Fjs9Dx4EL87L3wth5H7kC5IOKUNC69l/hp8I77Rq5ycETT0V6shG9INNfpsFp1p5LDCl
         ascO+YxtPS5UnDCeGjqPxWlcqUbtVjL9AH+qxmypE6qRTXtr6c05o5Vb7lTrBQsHtwke
         kqyw==
X-Forwarded-Encrypted: i=1; AJvYcCXYMiXIUS66BAP7m4aN2o30DQhaOQ6w4wL4vY2AYtCOTgh1wrz7lIuNdhN1ZT3+u7tsnqgD@lists.linux.dev, AJvYcCXgmVjgTkqtOWqW/1we4J60zSI0c7+fbrVUVRyrVGjVv5XP7JVdOnFDwHaM5oyrdhBjvxnHG+NOPeFfvBsvbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOptHXEhiPZw5UkOd0pTBIN31tDqWZ9OUP1e3gdCjT2cbYXox2
	WNEKblw2AaDUEINkms7WhMEjaH8z4UM1Qhs8PWEoqDl1uFQgGeGv9uVMKlOnjCFfP5kH19GvQK0
	zxZns6XTbNusJDevKrYtkl2o8/1QPjq8=
X-Gm-Gg: ASbGncsnLEvW6jYfItVHCYAOyQhqPO0igGFOgoFVrBh11RWvSA+lLthLdly0M3ybwCw
	fAijB44GT3N/cAihS3TzRZLb6Jd2JROUkhCj/kry+x+EjEjT3Av3SpS+kytStrUJNDLGErROFvA
	qE7CgIqn9HtL/BA/6mRAsGeTIYumF7V26D1wKT0znq0e910JfAwhwEn6Tl2RogdJRNmCTCX0Da3
	eVwatQ=
X-Google-Smtp-Source: AGHT+IHGpnFCjDTiG1geEjmCO6Bjhm3v/M3utulV0Br5gTrnexquUxAH087cT1ubTstp8fSrj3yHoRhbWJImvj9FtEs=
X-Received: by 2002:a05:651c:400c:b0:32b:3b5a:c4a2 with SMTP id
 38308e7fff4ca-3308e352419mr34008621fa.6.1752997532888; Sun, 20 Jul 2025
 00:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507190528.W6ndwfyg-lkp@intel.com> <20250719170413.9b64b9321c3ac082712348fe@linux-foundation.org>
In-Reply-To: <20250719170413.9b64b9321c3ac082712348fe@linux-foundation.org>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sun, 20 Jul 2025 12:45:15 +0500
X-Gm-Features: Ac12FXzyXQfBVhPlycXGDETMRSLjWoBYDV54ORm062NblE_kRUmN5joT8HHTgUg
Message-ID: <CACzwLxg4=Gx0J39O9Xt3tAif=Ux8mU-cbMfMi7VN97XtB+8Zfg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 160/175] mm/kasan/tags.c:145:6: error:
 redefinition of 'kasan_save_free_info'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 5:04=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sat, 19 Jul 2025 05:28:51 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
new
> > head:   b0e07b9befa0558a80b281b7efcdb3717881c969
> > commit: 3d3c26eaf9f6e00779d27dd54d763c9bdc5dda3c [160/175] kasan: add s=
hadow checks to wrappers and rename kasan_arch_is_ready
> > config: arm64-randconfig-001-20250719 (https://download.01.org/0day-ci/=
archive/20250719/202507190528.W6ndwfyg-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250719/202507190528.W6ndwfyg-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507190528.W6ndwfyg-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/kasan/tags.c:145:6: error: redefinition of 'kasan_save_free_info'
> >      145 | void kasan_save_free_info(struct kmem_cache *cache, void *ob=
ject)
> >          |      ^
> >    mm/kasan/kasan.h:403:20: note: previous definition is here
> >      403 | static inline void kasan_save_free_info(struct kmem_cache *c=
ache, void *object)
> >          |                    ^
> >    1 error generated.
>
> I'll add this.   It should repair the build, at least?

Yes, thanks, it should. Sorry, I've missed that.

>
> --- a/mm/kasan/tags.c~kasan-add-shadow-checks-to-wrappers-and-rename-kasa=
n_arch_is_ready-fix
> +++ a/mm/kasan/tags.c
> @@ -142,7 +142,7 @@ void kasan_save_alloc_info(struct kmem_c
>         save_stack_info(cache, object, flags, false);
>  }
>
> -void kasan_save_free_info(struct kmem_cache *cache, void *object)
> +void __kasan_save_free_info(struct kmem_cache *cache, void *object)
>  {
>         save_stack_info(cache, object, 0, true);
>  }
> _
>
