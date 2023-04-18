Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51149C94A
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 21:45:51 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id kt6so38645071ejb.0
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1681854349; x=1684446349;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7fzjxjpSJQbGFahxPhwqauiqYw82JYBD81Vlaf8aNg=;
        b=n8JnoZPj6nSoiMjCWqD+A8FQGaFm947tubfOwN8d6KbUhPu8/lp5EjJBguCkCuMVKK
         6ApNVzzAcgaLkuwqGRDQdM3KbXBZymURm+HdMHGVhVVhJl910gYm+lnnHchTCIHPsPt3
         z1q4QR0zF/wcKHG2FL4TEsFtMCCpYZTAKIcks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681854349; x=1684446349;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7fzjxjpSJQbGFahxPhwqauiqYw82JYBD81Vlaf8aNg=;
        b=Mp5ZjsuSRjTdA+84gq2s0+1CHxSQXXhLEgrWyKR3ttKJn+q0gN7lPGOz+EoWrvlLGF
         sRR/liEBfr0O6R4J12+JsRtdytiY2FH7nVC+CCk+YRde/Pr5S3HMeYD3DG3qMKoi1MVE
         eyW7Tt5rJHHJ2B2zZ6Jlapp1TOhT9BOdcE3FbyYV3HNAWiFX3mu1eBlg7wV/Ooy2MFD/
         s5yEQimi9jf4zZloNqDAwAhrXNuiJMOrpwpbmmcKWRGbgOqC21oNUJKAnWUK7ZHxltMP
         EXvnnB+1krOL3dMw+9/QV/akWYlR3h/A4JKsQeSbQOy4dy/2I0jhqGb5g8AgVreq2FmA
         slUA==
X-Gm-Message-State: AAQBX9fYhCCCxseQ1kW/yY6eFl/YWd+Zk6GC6d0J87w2uYrFaCx4hb0u
	dkZDdBZi0iGgz5d2FvCKiAPyqg==
X-Google-Smtp-Source: AKy350ZNFPKryyLDsksUkZk8sVrSowPL//l4P852yJIGScZucnixJVGJkKBnDd29l9yMxe0VpNomlg==
X-Received: by 2002:a17:906:564e:b0:94e:ec0f:455 with SMTP id v14-20020a170906564e00b0094eec0f0455mr11836365ejr.54.1681854349299;
        Tue, 18 Apr 2023 14:45:49 -0700 (PDT)
Received: from smtpclient.apple ([206.0.75.9])
        by smtp.gmail.com with ESMTPSA id se12-20020a170906ce4c00b0094ecd76eda9sm7499896ejb.182.2023.04.18.14.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 14:45:48 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: clangd cannot handle tree_nocb.h
Date: Tue, 18 Apr 2023 23:45:37 +0200
Message-Id: <F76FA81E-C173-418E-B44D-359850A0723A@joelfernandes.org>
References: <20230418210321.GA3648938@google.com>
Cc: rcu@vger.kernel.org, nathan@kernel.org, trix@redhat.com,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, paulmck@kernel.org
In-Reply-To: <20230418210321.GA3648938@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>, revest@google.com
X-Mailer: iPhone Mail (20B101)

Adding Florent as well since Nick added him to the other thread.

Thanks.

> On Apr 18, 2023, at 11:03 PM, Joel Fernandes <joel@joelfernandes.org> wrot=
e:
>=20
> =EF=BB=BFHi Nick,
>=20
>> On Tue, Apr 18, 2023 at 01:46:40PM -0700, Nick Desaulniers wrote:
>>> On Tue, Apr 18, 2023 at 1:36=E2=80=AFPM Joel Fernandes <joel@joelfernand=
es.org> wrote:
>>>=20
>>> On Fri, Apr 14, 2023 at 03:47:51PM -0700, Nick Desaulniers wrote:
>>>> On Thu, Apr 13, 2023 at 5:53=E2=80=AFPM Joel Fernandes <joel@joelfernan=
des.org> wrote:
>>>>>=20
>>>>> Hello!
>>>>>=20
>>>>> I have been trying to get clangd working properly with tree_nocb.h. cl=
angd
>>>>> trips quite badly when trying to build tree_nocb.h to generate ASTs.
>>>>=20
>>>> Hi Joel,
>>>> Thanks for the report.  What are you using clangd for? I'll bet
>>>> something interesting.
>>>=20
>>> Thanks for the response and sorry for the late reply. I am at the OSPM
>>> conference. I use vim and vscode with clangd. In vim, YCM uses it to
>>> highlight compiler errors live while editing, I am pretty happy with it s=
o
>>> far and has been a huge time saver. Enough that now I want to use it for=

>>> everything...
>>=20
>> Cool! I use vim, can you share more info about your set up for this?
>> I'll have to try it.
>=20
> This is how I installed YCM:
>=20
> # Install YouCompleteMe for vim
> # cd ~/.vim/bundle
> # git clone https://github.com/Valloric/YouCompleteMe.git
> # cd YouCompleteMe/
> # git submodule update --init --recursive
> # python3 install.py --clang-completer
>=20
> Then install and run bear in the kernel sources to generate
> compile_compands.json:
> bear -- make -j99 CC=3Dclang
>=20
> However, there's also the script:
> scripts/clang-tools/gen_compile_commands.py
>=20
> This generates the .json from an existing build. Thank God because we can
> probably make this generate better .json files which may make clangd bette=
r.
>=20
> You don't need YCM to reproduce the issue though if you just use vscode wi=
th
> the clangd plugin.
>=20
>>> I first came across clangd when developing Chrome userspace code which i=
s C++
>>> :). In Chrome, ninja builds can be made to output compile_commands.json.=

>>> However, now I noticed the support in the kernel and was like, wow I nee=
d to
>>> try it. Further, YCM seems to work much better with it than without :)
>>>=20
>>>> I've never used it myself, so I don't know where to even begin with
>>>> how to reproduce the issue.
>>>=20
>>> Ah ok. :). When I ran get_maintainer on the script, your name popped up a=
nd
>>> someone also suggested that you're the goto person for clang on the kern=
el
>>> (which I kind of already knew ;)
>>=20
>> You've cc'ed the right set of folks.  We might not have the expertise
>> related to clangd specifically, but we can point you in the right
>> direction.
>=20
> Sure, thanks! And thanks for CC'ing the right folks.
>=20
>>>> It might be worth filing a bug upstream at
>>>> https://github.com/llvm/llvm-project/issues
>>>> or internally under the component
>>>> Language Platforms > C++ > Clang > Tools > Clangd
>>>> with detailed steps to reproduce (and what the observed error actually
>>>> is). Feel free to cc me, though I don't know the first thing about
>>>> clangd.
>>>=20
>>> Ok I will consider doing this if needed. One thing I do observe is lack o=
f
>>> good support for header files and it is a known clangd issue [1].
>>>=20
>>> However, the fixes I was proposing can purely be done in the kernel itse=
lf
>>> since all it'd require is generating compile_compands.json with the -D<m=
acro>
>>> and editing files to keep clangd happy. I guess one question is, how wel=
come
>>> would such changes to header files be since they're for tooling and isn'=
t
>>> code that will be compiled outside of clangd.
>>=20
>> Specifically your patch sites some log print that doesn't look
>> indicative of a failure:
>> https://github.com/llvm/llvm-project/blob/53430bfd5c9d0074dd6de06dccea366=
e1d40bce4/clang-tools-extra/clangd/TUScheduler.cpp#L903-L906
>> so something else is going on here. Just trying to make sure we root caus=
e this.
>>=20
>=20
> Right, so clangd's log does not show failure, the failure is when it displ=
ays
> in the code editor that your code has compiler errors when in fact it does=

> not.
>=20
> So if you open up tree_nocb.h in vscode, for example, you'll see squiggles=

> saying 'undefined reference to rcu_data', etc. That makes clangd stop work=
ing
> at the error. Sorry to not make the failure mode clear earlier.
>=20
> thanks,
>=20
> - Joel
>=20
