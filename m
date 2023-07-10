Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD216400
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 21:22:23 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-635decc135eso28664326d6.0
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689024142; x=1691616142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/AHnLRjSLfFE9cPgB0m1arr9qA/D4bUxDLvGm185g4=;
        b=p5bEh9YpRBSvdjZQX8rMsK7yK10d4+t79qj0lXTV1iANI6Zi8/7mfKnUVPneSAWGET
         ocTlr4vlq45Nf+fvDaKYPrSTPBYfUMtsHoEqbWVHyWwlcRUgZ9oCYjxSSudPXmEL0vQ6
         fE3BP/WKikO8G8l0OLD/RFGA82qdICWixK1tuplEuNXFFkaLuv2dTqJpTlTvhbmLG+3S
         ip4z8zyBOTNeMBaEqdcwVyvKXYwYLVouJpqAIRs8TdYl9HzCrCcKvHx1PvH1+7W3jDfk
         9Fe1T81re8u4E2XdgUAOawq6VYTSS/Y5WnEmPyoNPnZ0F/9QnAAQRw+HOlENg4ZLEMcs
         0SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689024142; x=1691616142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/AHnLRjSLfFE9cPgB0m1arr9qA/D4bUxDLvGm185g4=;
        b=CSEkrZBgdAywS9f5AsheIxUvFNBJkP0puG3mDliwKHy0UQTgP57w+V8qAC3y/PvLep
         Gf5qmWjra6/oLju86UPjDZsp5Au2WsV8ERDNhbvC6ZWX0I93F8/UAyy3oyDmCprmkrAX
         s4Kgm2H7YcfwYxFDXa+aKwh4p/rJ810dz987gyZVc8prypF8aXiniekX4jNsVYrSH/on
         vsxomZgiDjwgCNhUr/a9nzAZmdDWzkFe8qEZReIykmtv5mrWSvTHQ0r33BhV/RHCoITh
         r2eHfkdEOyD6eMKdKkWH81Cle84B/1KmDFwOAmM279dCJoNp1B9OF90YI0gsQf+ub9Qy
         aR/Q==
X-Gm-Message-State: ABy/qLb60Et1hYvSmiTpLM5RLUVOuI0JsL2sB8aXZGUrhc1y8PnRBZwj
	LQyRXU7eiyjvAPmwHLBgeIdHECRAc3hE8C60THKB3Q==
X-Google-Smtp-Source: APBJJlEyTl3gs/z6eTnepp8nz5+pFBwJ2K0VEGAzQIoNlATKxCwU0usk0HgClb+WScNXShjcKaBO3hflJJH/vIj4QtA=
X-Received: by 2002:a0c:9701:0:b0:634:97ed:9a5f with SMTP id
 k1-20020a0c9701000000b0063497ed9a5fmr14901888qvd.26.1689024142302; Mon, 10
 Jul 2023 14:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnrHErOK+w878izVauHUKaX3eD-HXgigq2Ogm3iSj-fHA@mail.gmail.com>
 <76CB17D0-5A66-4D49-A389-8F40EC830DC0@sladewatkins.net> <CAP-5=fXVgwMO_CpS-EHN6PFhLB-J5Ft7qHz7oQd-WOMnTj72Cw@mail.gmail.com>
 <CAM9d7chvZjZ4YVc6j3w7OkdHteyJ0GUZboieu9G7jAWBevoZqA@mail.gmail.com>
 <e553c4f8-ed3d-0755-cc8a-b5ffe43b2c2f@amd.com> <CAKwvOdk6TTNhu_+FdONTXPo9Z8u5D4-5kf-rMN8oK4+6fMyc-w@mail.gmail.com>
 <CABPqkBQVfQFJKCdHXEMGFcupzvy8zq14F52eLW5s9vr2Shmi6w@mail.gmail.com>
 <85822c3c-2254-52cc-e6b1-9c89adb63771@amd.com> <CAKwvOdkfEexsE07XXGW3FF+nMt-pR8uv2EA7QzsPbEZsSQBO-Q@mail.gmail.com>
 <85aabdc8-07cd-3285-1f3f-605f9ebbab18@amd.com> <b6a503b7-b421-a5c0-1cc8-4f1567b8d9de@amd.com>
 <CAKwvOdmY7qoSG61f7UouWFz+gNN531FhpHbqawrAKCNKNDJHnw@mail.gmail.com> <5c077e61-c206-812f-1cb9-d47785e8176f@amd.com>
In-Reply-To: <5c077e61-c206-812f-1cb9-d47785e8176f@amd.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Jul 2023 14:22:11 -0700
Message-ID: <CAKwvOdm9SAQ5i74JUzWP4Q1WW3aHq+3Jo7hqfie+oMxjnKqxSA@mail.gmail.com>
Subject: Re: Invalid event (cycles:pp) in per-thread mode, enable system wide
 with '-a'.
To: Ravi Bangoria <ravi.bangoria@amd.com>, Namhyung Kim <namhyung@gmail.com>
Cc: Stephane Eranian <eranian@google.com>, Slade Watkins <srw@sladewatkins.net>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ian Rogers <irogers@google.com>, Kees Cook <keescook@chromium.org>, sandipan.das@amd.com, 
	Bill Wendling <morbo@google.com>, clang-built-linux <llvm@lists.linux.dev>, Yonghong Song <yhs@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 10:45=E2=80=AFPM Ravi Bangoria <ravi.bangoria@amd.c=
om> wrote:
>
> Hi Nick,
>
> On 23-Jun-23 9:53 PM, Nick Desaulniers wrote:
> >>> On 12-Oct-22 3:02 AM, Nick Desaulniers wrote:
> > Hi Ravi,
> > Sorry, I'm not able to load a custom kernel image on my employer
> > provided workstation, and I never got approval to expense hardware for
> > testing this otherwise.
> >
> > Was there ever any update on this? I'm on 6.1.25 now and still cant run
> > $ perf record -e cycles:pp --call-graph lbr <any command to profile>
>
> Per-process precise sampling on AMD platforms should work from 6.2-rc1
> onward.

Ok, I can wait for my employer to ship 6.2 on our workstations.

> However, --call-graph=3Dlbr is not supported on AMD (hw limitation).

On any AMD uarches? Is there an equivalent? LBR encoding is compact
which makes working it much faster than DWARF or stack frame
unwinding.
--=20
Thanks,
~Nick Desaulniers
