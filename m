Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2371F1426B
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 05:18:53 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4881eab4de2so158630e0c.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692335933; x=1692940733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kpLB9nUoya1zg6wDKkXayE7Tz/XHKIUeAAVe5xKhK0=;
        b=KaJjLiyhBSvhpgsm8YiFaBS8xI7UGZoG5drkaowj2GP6x3bnrlC3xOI9td0TTSOaAe
         U8CIrSHQWflISPqATW2Jo4GQiAlJPU0m/8d2f85PGndrz8aD8hfh2jAjRsTiH+CTkLXa
         m7Jyn6jzSFdoWq8Cj3ukeolSvabGfHWqd3VkCvjM329jQTuiE3+JNp4UdwbXKk2U9XJN
         +sVLZ11JcehL6jteXQVA0W10g46ms6XNkh0ocrcENaiTzXDHMmhQV2Yk2ioO5jxIIELt
         b9a3SmTagu6fnJsvmeaZRCTHEiUrhVsd+wOWsCbL+Vw6pMR3+OvW+biIoAtgD8wdZeIS
         w68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692335933; x=1692940733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kpLB9nUoya1zg6wDKkXayE7Tz/XHKIUeAAVe5xKhK0=;
        b=HyMnryeJCkpArpiYZ7j40oE5VEFsQGLnNcVZNZnOeCBhaipViKxP30kjg0/gbPFs9o
         YzN6zRd5R0ViTN+owfFW67ZjnxDOfm9bx7aTuSQmDdFNg3QfuPhO8DjXL6hC8ZI0jUPY
         ntWeVrNeUYJqgTa0bgK+V8PIPx1Dv52u4NZSj6heqjoRsYh7ubUyqLBl0n/060SytFbc
         FVw5A3Y0yTtDsduXJ2wfBq2porpE/ioRwE2FFBgffgPIa/gTB9bo84Xn6bUIgYpmDnIz
         YQZakky/pEi39/xjrlMAcA5KhCp57seomxHm5ur90CAhH/ZCLSa7+XEM8FlBbd1TGU0Q
         tTFw==
X-Gm-Message-State: AOJu0YyO+DaAsfQXi1WwLamnjekg1PbiKM+CE8Gmh2WEJHWy9ScrMgbs
	0Tccdy10LUurAEKZeVYJzs1ex0hb1f20OMYSDrg4sg==
X-Google-Smtp-Source: AGHT+IEf2oEZW2NUvuhCzB/XQOkZOamd12TFRt7JdNd8j2TpdIAQwd5X10QtMAXKbXbUwLs+I54R8FqOfRXoI/bJsKM=
X-Received: by 2002:a67:b648:0:b0:44a:c20a:ebb1 with SMTP id
 e8-20020a67b648000000b0044ac20aebb1mr1545884vsm.13.1692335932647; Thu, 17 Aug
 2023 22:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvFD-kE0+EGWkwcnR1DXRxh7p7OwQThJ6KWxYWVROJ4+A@mail.gmail.com>
 <CAKwvOd=h4aFisiY0w0awKkxk+i-aJM5+QbExYnboqzojLigx1Q@mail.gmail.com>
In-Reply-To: <CAKwvOd=h4aFisiY0w0awKkxk+i-aJM5+QbExYnboqzojLigx1Q@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 18 Aug 2023 10:48:41 +0530
Message-ID: <CA+G9fYtRMde7Ksswa8pY8sFgnWVN-snRHfz4YRM04HSQ4LFBZQ@mail.gmail.com>
Subject: Re: landlock: fs_test: fs_test.c:4524:9: error: initializer element
 is not a compile-time constant
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Shuah Khan <shuah@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Aug 2023 at 21:24, Nick Desaulniers <ndesaulniers@google.com> wr=
ote:
>
> On Thu, Aug 17, 2023 at 3:51=E2=80=AFAM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > While building selftests landlock following warnings / errors noticed o=
n the
> > Linux next with clang-17.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Build errors:
> > ------------
> > landlock/fs_test
> > fs_test.c:4524:9: error: initializer element is not a compile-time cons=
tant
>
> Hi Naresh,
> Can you tell me more about your specific version of clang-17?

    compiler:
        name: clang,
        version: 17.0.0,
        version_full: Debian clang version 17.0.0
(++20230725053429+d0b54bb50e51-1~exp1~20230725173444.1)

>
> I believe a fix of mine to clang should address this. It landed in
> clang-18, and was backported to clang-17 recently.
> https://github.com/llvm/llvm-project-release-prs/commit/0b2d5b967d9837579=
3897295d651f58f6fbd3034
>
> I suspect your clang-17 might need a rebuild.  Thanks for the report.

I will rebuild / re-test and confirm soon.

- Naresh
