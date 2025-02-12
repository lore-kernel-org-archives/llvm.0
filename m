Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282320B7FD;
	Wed, 12 Feb 2025 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370866; cv=none; b=LmQM2T5Qs0zlqbpWsOv1v+vG4RcM2oXeqJuxMX9ncuRafDtHhx38BgBLTZwcGw5VMnManT7WyoigkwEYlK3pwvB8/zG/J1tiZXJ0aFDjX9w6GlmlZU+ij6Iu8PBf/OKDwEYamirNtWcFqqscrZLTecdbxlBgTx1Ks+mJvUltARA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370866; c=relaxed/simple;
	bh=kpvfNiHpkp4jI/JVfA51Eh4PML7TdlfOJpDLg1J2rA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7D9kyDte23ULIx8PGf1WhiSkiC2oP1PnZU3hrwooS3Vufll0UWoNwbwY36EJwcW3yea1oDepiRF/M0xe4oS3AfAUwBzSjOU7KItmuZ8Xrg5XH3/ryCMzQ52F7OCdF7BqrNaThxxVBXph3e9TKi2WTR3f7NwBcapnzlx7DgFyoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/iIn8p4; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/iIn8p4"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30761be8fa8so67844821fa.2;
        Wed, 12 Feb 2025 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739370863; x=1739975663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5UWrZt1SbRLiPbOCZ3FDQEs4EokuYZL5IQM659E4VQ=;
        b=l/iIn8p40efRtbfk0JmxEkOzD1nPEGvMp5AjKP++a0TcgoEbUWtYapMIE97ZGsc0qj
         j21oGzR5GHBnhp9KFuYJJxwz1k6LqrOodzKeDoBxo68Mg8NVyvI6vGO9LFW4go68fFLD
         s2xN9vFOZCKsxfk/BXwou1t608OXjyrPxno9waM1L7aA0DHUPwuTFlZQOmgGM3pEzSq4
         9W44ni1HTXMTBPB0bewMY7rs+Wr64Qd7l6j7RTD5RJGdfE0CpTw82tYxNmQ48UCpoL9z
         ISlIIC2xeWdEf5GWj3VjMVD2ZKCXLRINssPKxQY/zYxeoV8XfFVgHpQnvRKRoM/F4QWP
         kOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370863; x=1739975663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5UWrZt1SbRLiPbOCZ3FDQEs4EokuYZL5IQM659E4VQ=;
        b=Erhx3q+Ag0m/5KlFjpexDU8Owh/SLVEJ3wfv0qbXzpn2+kEtdrmO6tp6BNA7epxpBM
         8DcdZFr009LlmzVW5cAFALjdQ6DmTAeuyD11RNwNvIhiKi0XyCheYko0/ViFW3NJ0cNh
         GhsJBK80R+So4R+/EJMLGg0G2HP0V5vjg5wC9txpTblFrPznsewxvJXi4NcZtCJ60jHe
         fwLamPGlvg6Rg8oKfrBkhcKk0gMcUiifclamWztJmtqq7JuzJln8OioJYMxZzxnWA72D
         G3Tv/OvomMkQUsXMsn789c3PvYpBV7IWJUPNaqb5sBazyw7EA1RZNAHZRZVg5xVZOFGm
         x/oA==
X-Forwarded-Encrypted: i=1; AJvYcCUGqDOcowKdGpCKQTI8NSjHbx1PbRq76kf5Ac//x3MREv1bUekF3hE5GI3byygkfYHKsC3IqYCmQIiJDksQyg==@lists.linux.dev, AJvYcCW0FxwIXGc3/19AzbT0aBCASfQpWyGPR0F6Me5G7NnuQYmZyGYO2eBZ634mRwFfQTlnDs8P@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2irpbyT6NKKPWcJ5zPxZfTaml85GbvYdGryO1Ix7Sq1e1Wz8T
	lPLU8ji25jcDFkSUcUAzhbXt+sZ3pNBoppCJozOsUvFw0T8cc7l4RFyvSSpxwRPQTjQT3gT+ob7
	KaWbUF1FZ6Lhm2FJLqEvGhlCfTSk=
X-Gm-Gg: ASbGncuggnWiFj9T4gARuwH6m+7yx7QwHrbC2F10OONwm0jql5i4n/HI3V38McKSXD+
	xBRaT31tP79Anzxe6v58l/1FTfkwJFUkyWHGuQINOP+eDemBjDzXSBOXJHbxsS87t5GS3diocfB
	KTRWl0y/VByrTg
X-Google-Smtp-Source: AGHT+IH9eMUdHQrEJvRoMiHM5wWub8oT4MYD54w7JiRl8QYpmi+XqlQDqR1rViAif3p0R0UwpjfWAYqFDuP/fHTXwgY=
X-Received: by 2002:a2e:a90a:0:b0:302:2c61:a1d3 with SMTP id
 38308e7fff4ca-309036eb500mr12184221fa.36.1739370862710; Wed, 12 Feb 2025
 06:34:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com> <3dabe058-2308-4990-8e5d-0af1efd27431@stanley.mountain>
In-Reply-To: <3dabe058-2308-4990-8e5d-0af1efd27431@stanley.mountain>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 12 Feb 2025 09:33:46 -0500
X-Gm-Features: AWEUYZkkeElNnRNC8RIypph5mg5FZAiJl4nwjjINbxtzd2iXi_UiZ6XRGHLQ864
Message-ID: <CAJ-ks9=mKzgLhJW0dV-L8eFtkW-xt8v3GM51V4QF5Ef_ENKLvA@mail.gmail.com>
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, David Gow <davidgow@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Feb 12, 2025 at 6:53=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Tamir,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/w=
w_mutex-convert-self-test-to-KUnit/20250211-000245
> base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
> patch link:    https://lore.kernel.org/r/20250210-ww_mutex-kunit-convert-=
v1-1-972f0201f71e%40gmail.com
> patch subject: [PATCH] ww_mutex: convert self-test to KUnit
> config: i386-randconfig-141-20250212 (https://download.01.org/0day-ci/arc=
hive/20250212/202502121806.CS6r741y-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502121806.CS6r741y-lkp@intel.com/
>
> smatch warnings:
> kernel/locking/ww_mutex_kunit.c:238 test_abba_gen_params() warn: shift ha=
s higher precedence than mask
> kernel/locking/ww_mutex_kunit.c:249 test_abba() warn: shift has higher pr=
ecedence than mask
>
> vim +238 kernel/locking/ww_mutex_kunit.c
>
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  231
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  232  static const void *test_abba_gen_params(const void *prev, char *de=
sc)
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  233  {
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  234        static unsigned int storage;
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  235        const unsigned int *next =3D gen_range(&storage, 0b00, 0b11,=
 prev);
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  236
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  237        if (next !=3D NULL) {
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10 @238                const bool trylock =3D *next & 0b01 >> 0;
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  239                const bool resolve =3D *next & 0b10 >> 1;
>
> The shifts here are weird...  A zero shift is strange but even the 1 shif=
t
> is odd.  The current code is equivalent to:
>
>         const bool resolve =3D *next & (0b10 >> 1);
>
> But changing it to:
>
>         const bool resolve =3D (*next & 0b10) >> 1;
>
> Doesn't make sense either...  Probably that makes less sense actually.
> What are you trying to communicate with this code?

Yeah, the bit shifting here is not necessary. I'll replace this with a
proper bitfield.

> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  240
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  241                snprintf(desc, KUNIT_PARAM_DESC_SIZE, "trylock=3D%d,=
resolve=3D%d", trylock, resolve);
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  242        }
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  243        return next;
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  244  }
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  245
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  246  static void test_abba(struct kunit *test)
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  247  {
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  248        const unsigned int *param =3D test->param_value;
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10 @249        const bool trylock =3D *param & 0b01 >> 0;
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  250        const bool resolve =3D *param & 0b10 >> 1;
>
> Same.
>
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  251        struct test_abba abba;
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  252        struct ww_acquire_ctx ctx;
> daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-=
10  253        int err;
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  254
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  255        ww_mutex_init(&abba.a_mutex, &ww_class);
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  256        ww_mutex_init(&abba.b_mutex, &ww_class);
> 70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-=
01  257        INIT_WORK_ONSTACK(&abba.work, test_abba_work);
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

As an aside, how can I compile with the warning settings used by
kernel test robot?

Thanks.
Tamir
