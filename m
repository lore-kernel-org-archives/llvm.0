Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32DA2594
	for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753228931; cv=none; b=r4hriOhFuCkctQ46wVDZTCW6fKKVXPUOtDvMeF9s7NaVIEXIWpkmDk+CTyDfvF+cN7TNRBig4FzKSATnU9m6odSboKtcjVdVOI05f2NLOJFhLkw7XhwdREiKkva/ZsK25tfZCExqAjEF1G1B8SucH+J0nfl+OtKm4pgKNc2whJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753228931; c=relaxed/simple;
	bh=dewk3TAValYYQExAPJkqLo7eeu1mdvuRf3ddUbYlT50=;
	h=From:To:Cc:Subject:Date:References:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=YmK/14Nl7fU5ab5jTt4e4HY+ooqXSRnx4BP9KXSMR+go/i0/YcbsImItJa0NMybuKrCM1YHJlOB67RO5wUGLIyDOUWr9R9SeyppsFf1eqWXbZhiULyb9hgItS8003BVav3g6HQzn+Dp8wBlShbZoZnZg3wMPO/qWRdYabO9MxK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIhubmz0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIhubmz0"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7494999de5cso4150397b3a.3
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753228929; x=1753833729; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afioNrw39xivAx0anOKx/PDNnLStyhXg1rvkkGxqeuY=;
        b=LIhubmz0pvcYNnB6PDpK4M2tyvB7RDTRx2MRe0d7xzPIxZbs1hw0ixE3xxfdw2oVds
         lgCr+LgFF3PD/SYizOsWJpxVvWoZsVadMF88Atr+zh6P67bzL8WUMijVK6ov8RNu7/6I
         yeP6gY+ClygK8lphX1t3PsHLvQqOIdPbLYovz8cmv1dEjSnhLe3OjM/gL8lY3SPjb0gw
         YC2wx7G6bBWwgsW3AFdQUa0CVwovQ4yveOzU79HmJvQ4kbyS+9VJQiS0uchccEr7UJea
         dKF/NEkGLYtkT8+eeRp0aYoWfvAjydgbe5IFJ4c4uQXGdm2s7xqqS/tsBfDyDGxFOG3N
         Ss7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753228929; x=1753833729;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afioNrw39xivAx0anOKx/PDNnLStyhXg1rvkkGxqeuY=;
        b=lM9Zb4LgT4uD/BrQJGiy9Bn7IKSwJG/N2NSF1rTqtTKWnVVMbIVN3mCJlAnNRVoa4L
         5or3UJgmMDbQeKycJ4YeBqWLNn99xGH9oe3iQo4zxeg77PSu5jzYeHHlsMQvu4sH/9//
         fobuvVj7fsyX8UBebtBeK1P4LL9XEKNzIntQqO5OC1+W42zz7hKIViK3VcwQYb9MJddB
         3kl6AeLa1y6uMJJSrFEqU0Rlnk4gG3KZEXyq5rG0wQ5AcuWx++vxYyR+KWCblX0XL8CH
         M5ngdMySlVMSkGRFet35no1sTjvGDj7TrR7Xqh/V+lskfUvxnlC9acwkSdWREtSbDSH1
         81EA==
X-Forwarded-Encrypted: i=1; AJvYcCVC8CO2jJd7n4sx2rat7mG1YhXgHxo4ryYhqbRO0WUCGbuXoaCQomSM8Pl15SmkgJpTX7oz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4L17hWMLuuilM58E9RFV62iaOW0jQIT5jztAtNzUEqNrNl/Vx
	1Yw5G3pcVa0l0Y+7LPXiY/molEuOk4zUVhlSCu5aK0Fg5kLlIKl8kXoHAmJiRcTYRb4=
X-Gm-Gg: ASbGncsukbgZu6PjbyDG9hcKVkDGqaFBQmq61krUG8XX5Fi/qlj1a1Tlsb0drbNOCLq
	b98PrKHfRnZoqCtq7CWlWKty1UfS7WeNOhxRt1gLWA5S8f1/R0mkTSYalkzXCBNE9glJ/5+WDoj
	jDQW/1JMICkI0xxu9x1mhjC9yUAV4mNIXsrC4nS/EBK7PZs4rsYFTFvmvGiC2ZHL/tuc6EA2Ig1
	Zflc37ejWqN5ZTySOZ9Ju9KmEi/u0mxpNHsexM6No0ShxBFcNkq8Cp8SFtH0vCVpgZCeKDumfwR
	gSZxuHkgKfQ8Ru3VSeiF/e1frnIh3CnSBmW0UhqJHiX5tQ10r726rSSL2qhntHGQsKoeBfLEQ9C
	VSB4fZ5AFhBFJ7x2D6/92/zI=
X-Google-Smtp-Source: AGHT+IEOrOtE3x8MeA1SKBJMd59JULb3/k3gDSOBVNnDEa6DvuyNQgbznfPDnTFZY/cLR7sKgxhnHQ==
X-Received: by 2002:a05:6a21:6b0d:b0:222:d191:5bbd with SMTP id adf61e73a8af0-23d491446f0mr1142486637.39.1753228928763;
        Tue, 22 Jul 2025 17:02:08 -0700 (PDT)
Received: from 1337 ([136.159.213.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5820sm8437213b3a.52.2025.07.22.17.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 17:02:08 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
To: Fan Wu <wufan@kernel.org>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G?=
 =?utf-8?Q?=C3=BCnther?= Noack <gnoack@google.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] landlock: implement memfd detection
Date: Tue, 22 Jul 2025 15:56:38 -0600
References: <20250719-memfd-exec-v1-0-0ef7feba5821@gmail.com>
 <20250719-memfd-exec-v1-2-0ef7feba5821@gmail.com>
 <CAKtyLkEJKLgO1GvpTNmW=DnRhrsiPXGgz9=F7oJXVQPLSocSeA@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 30.1
In-reply-to: <CAKtyLkEJKLgO1GvpTNmW=DnRhrsiPXGgz9=F7oJXVQPLSocSeA@mail.gmail.com>
Message-ID: <87v7nj7p1d.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fan Wu <wufan@kernel.org> writes:

> On Sat, Jul 19, 2025 at 4:13=E2=80=AFAM Abhinav Saxena <xandfury@gmail.co=
m> wrote:
>>
>> Add is_memfd_file() function to reliably detect memfd files by checking
>> for =E2=80=9Cmemfd:=E2=80=9D prefix in dentry names on shmem-backed file=
s. This
>> distinguishes true memfd files from regular shmem files.
>>
>> Move domain_is_scoped() to domain.c for reuse across subsystems.
>> Add comprehensive kunit tests for memfd detection edge cases.
>>
>> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
>> =E2=80=94
>>  security/landlock/domain.c |  67 +++++++++++++++
>>  security/landlock/domain.h |   4 +
>>  security/landlock/fs.c     | 210 ++++++++++++++++++++++++++++++++++++++=
+++++++
>>  security/landlock/task.c   |  67 =E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94
>>  4 files changed, 281 insertions(+), 67 deletions(-)
>
> =E2=80=A6
>
>>
>> +/**
>> + * is_memfd_file - Check if file was created via memfd_create()
>> + * @file: File to check
>> + *
>> + * Returns true if @file was created via memfd_create(), false otherwis=
e.
>> + *
>> + * memfd files are shmem-backed files with =E2=80=9Cmemfd:=E2=80=9D pre=
fix in their dentry name.
>> + * This is the definitive way to distinguish memfd files from regular s=
hmem
>> + * files.
>> + */
>> +static bool is_memfd_file(struct file *file)
>> +{
>> +       const struct dentry *dentry;
>> +       const unsigned char *name;
>> +       size_t name_len;
>> +
>> +       /* Fast path: basic validation */
>> +       if (unlikely(!file))
>> +               return false;
>> +
>> +       /* Must be shmem-backed first - this is the cheapest definitive =
check */
>> +       if (!shmem_file(file))
>> +               return false;
>> +
>> +#ifdef CONFIG_MEMFD_CREATE
>> +
>> +       /* Validate dentry and get name info */
>> +       dentry =3D file->f_path.dentry;
>> +       if (unlikely(!dentry))
>> +               return false;
>> +
>> +       name_len =3D dentry->d_name.len;
>> +       name =3D dentry->d_name.name;
>> +
>> +       /* memfd files always have =E2=80=9Cmemfd:=E2=80=9D prefix (6 ch=
aracters) */
>> +       if (name_len < 6 || unlikely(!name))
>> +               return false;
>> +
>> +       /* Check for exact =E2=80=9Cmemfd:=E2=80=9D prefix */
>> +       return memcmp(name, =E2=80=9Cmemfd:=E2=80=9D, 6) =3D=3D 0;
>> +#else
>> +       return false;
>> +#endif
>
> I was trying to do something similar early this year but didn=E2=80=99t h=
ear
> feedback from the linux-mm folks.
> <https://lore.kernel.org/linux-security-module/20250129203932.22165-1-wuf=
an@kernel.org/>
>
> I have considered this approach but didn=E2=80=99t use it. My concern is,
> potentially a malicious user can create a file in a shmem fs, e.g.
> tmpfs , with the =E2=80=9Cmemfd:=E2=80=9D prefix, which can be used to by=
pass security
> policy.
> (Resending this message due to a misconfiguration with my email
> client. Apologies for any inconvenience.)
>
> -Fan

Hi Fan,

Thanks for your comments.

I agree that an LSM hook into memfd_create() would be a much better
solution. In the absence of such a function, do you think adding a
`d_unlinked(dentry)` check could serve as an additional verification?

I say things since I *think* that legitimate memfd files are always
unlinked while spoofed tmpfs files remain linked. I could be wrong
though.

In any case, we can test this approach using kprobes to validate
the behavior.

-Abhinav

--=-=-=--
