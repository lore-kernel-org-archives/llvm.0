Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738AB1F165
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 15:28:58 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-317c3ac7339so6443647f8f.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695655736; x=1696260536; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlVgh8EnQKoomI327WbStof7/h21QJuD1LkDI6BFm1M=;
        b=3F7tIuFZTNdE8BPZdGR2G2L/HPmsnavPdJkK8qILLsyJTb0Nb/Lv7uhN/KboStk0hR
         fsjxqCY0JSezTPy1c5bvlLz4u25GEou9sYIZWq73wMFEVmHZM/+bPBMUp4xYbgmKVGhT
         MA4DxJ+nT0Wq/pnrp724If1NBiSQKaXWracIpnGfih5tGNaTKrKeoqFA53tHNo6jPZDX
         aQnYa3U7mMFVU33DzYN3QVlMo7lHyz5VlJZECKza0R9sjpza11oO4vAa/TJexlIm4MAi
         Hz6HncGTRu5OSlvOTQeJS9WtjgGDOXapyNOm0vPWRL9FFeDdVu5MR9EdtFl63pZNg15w
         fxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695655736; x=1696260536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlVgh8EnQKoomI327WbStof7/h21QJuD1LkDI6BFm1M=;
        b=Hm6EJdlzoKt0QhSF6XBhKXaGjlmd+XDKom7anKiCaa57VpSqP+V5gTI4Qh3n6hynhU
         pX4MD0xwSdDP02sGvmr/R2Vll+TUlVEIJtTPmGiDm9kVcTGZtNvvzS0RJJAGo2sPlDoI
         F932/xHw6L3oNbShgLyDsNv/6g/oMD7U88362OumZ8kwBjEn/h0eDqV84UsXcALJX5fZ
         CvVFCQ8xyw0GcVWOxrWq08HkVMIwAC6Wa1Lmu6vS5FdPt2ppn5l5fHCARzcyAjUw5djo
         XtVFEVfNc0jcfCVaKJwl6kwY94y8EDQe4GPu1xyVMvU+YsievTsLV3Z55luhGmTj7Q0y
         bIDQ==
X-Gm-Message-State: AOJu0YySqeYjlbcGogJxQb8pZ4Av4PvuQTnQuYnpAY17TE5X9VeLVePE
	bDVhHHChcyvVDftiDdXAUeq546jZlv5naRTaj8wwUw==
X-Google-Smtp-Source: AGHT+IFryUcP5aAWfFUDYotj0onLpApQM/7k0ngL42Fn2eMECkc1E0s2G6R5IKpC0CDY8q/vaUUxOQN0rCzNO7AiKPs=
X-Received: by 2002:a5d:5389:0:b0:31f:6524:2de1 with SMTP id
 d9-20020a5d5389000000b0031f65242de1mr6477947wrv.32.1695655736299; Mon, 25 Sep
 2023 08:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <CAKwvOdmni7Vqo0W1qgGkVx8GH4+D7JXO5QTQgqGv8D=Go4oPAA@mail.gmail.com>
 <CAHRSSEz=S_c=KmgDNL_FenUJ25jLmwKe-QXo7-_nUC-7avD0Gg@mail.gmail.com>
 <CAKwvOdkHE7rXgOUyUSCKZ690bjV88E9yVfmG-7vLH6iqqr2G-Q@mail.gmail.com>
 <CAHRSSEzD=nMKjnmJxsGuPdMy2iqc-jxcppna_eKOb8PH0SQOXA@mail.gmail.com>
 <CAKwvOdk5qut5-EX9N2eJQ7KiaUNFv4CBo_Hh2BJOD+bnupKvQA@mail.gmail.com> <e6e5f76b-9303-82a6-f414-5753d80a0ad2@collabora.com>
In-Reply-To: <e6e5f76b-9303-82a6-f414-5753d80a0ad2@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Sep 2023 08:28:45 -0700
Message-ID: <CAKwvOd=1q9hDHCvi1wwB+pr_UMNdVD3rjmuBWsHgm5+M4Mshyg@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, 
	kernelci@lists.linux.dev, clang-built-linux <llvm@lists.linux.dev>, 
	Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 1:16=E2=80=AFAM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 20/09/2023 18:57, Nick Desaulniers wrote:
> > On Tue, Sep 19, 2023 at 5:12=E2=80=AFPM Todd Kjos <tkjos@google.com> wr=
ote:
> >>
> >> On Tue, Sep 19, 2023 at 4:19=E2=80=AFPM Nick Desaulniers
> >> <ndesaulniers@google.com> wrote:
> >>>
> >>> Half of the red exclamation marks on that link are are "0 warnings - =
0
> >>> errors".  What's up with that?
> >>
> >> This more recent build has "0 warnings - 0 errors":
> >> https://linux.kernelci.org/build/android/branch/android15-6.1/kernel/A=
SB-2023-07-05_14-6.1-2620-gf2d0380464d3/
> >>
> >> Here is the error (not sure why it bubbled up as 0/0):
> >>
> >>   AR      drivers/base/power/built-in.a
> >> ../fs/namei.c:2172:13: error: use of bitwise '|' with boolean operands
> >> [-Werror,-Wbitwise-instead-of-logical]
> >>         } while (!(has_zero(a, &adata, &constants) | has_zero(b,
> >> &bdata, &constants)));
> >>
> >> ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>                                                    ||
> >> ../fs/namei.c:2172:13: note: cast one or both operands to int to
> >> silence this warning
> >>   CC      drivers/base/firmware_loader/builtin/main.o
> >> 1 error generated.
> >> make[3]: *** [../scripts/Makefile.build:250: fs/namei.o] Error 1
> >> make[3]: *** Waiting for unfinished jobs....
> >> make[2]: *** [../scripts/Makefile.build:500: fs] Error 2
> >
> > Guillaume,
> > Any idea what's up with that? Seems like the existence of diagnostics
> > is detected correctly; the number of warnings and errors is not.
>
> Yes I think there's some heuristics in the legacy log parsing
> tool to count the number of compiler warnings and errors.  This
> probably is outdated with Clang now, so the build exit status is
> used to detect a failure but then the stats are off.

Right, I think clang-17 changed the structure of its output to use
pipes `|` similar to GCC.

I've been keeping my eye on something called SARIF, which is some kind
of structured interchange format for diagnostics produced by compilers
and consumed by IDEs. (Pretty sure it's just JSON).  That might be
interesting to pursue in KernelCI so that the diagnostics don't need
hand rolled parsers (that can break).

>
> It's better to avoid fixing this code as it's going to be retired
> in a few months' time to be replaced with a fresh implementation
> based on the new API.  I believe some tweaks could be done to fix

Oh? Is there a ticket I can sub to to track that?

> critical issues, but if the detail of warnings and errors can be
> found even though the stats are off then maybe we can save the
> effort of fixing it?
>
> Cheers,
> Guillaume
>


--=20
Thanks,
~Nick Desaulniers
