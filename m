Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1507A
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 18:47:37 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id r17so13901297lfm.11
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=spLx4BmS0ESQuFMLlfBbiEsVcFilYdm6jlWZCb/lP3E=;
        b=rIwKG1dyJQEyjuMi1QLgibUoOzQIG1Och0sDLUfq6AwqMRaKay8U1ROjw0BPOQfccD
         ypVPSWEgS6aO1jHxtVHzma4sMfFhmKGIgZNTM7IWPQNYoO4/hIjZB2MSbV2LD4ISmLEB
         2rJQgmWnWMHsqHk6bQn7cQZ6+BSlQmP9Y0iTz5lgBRmV6cZAQCeUKSfbtAejOW7C6nuj
         JBiVhW467pd3ToP3UI/g16Cw7hsMJZVfnWvys3vBRc+1Paf+Z5kHa1ZWZ7EYlby7eDtl
         yc03WR8YamDZ8u/kRiY26QQErFvgCf1qmea0t+hHyYMTfNjhwVvvFAYfkFS0YuCx6xOX
         4K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=spLx4BmS0ESQuFMLlfBbiEsVcFilYdm6jlWZCb/lP3E=;
        b=hbyzEYBaO0fhzl63XchUoypVS3TbKQoZUwhZe4X9xayMbGQYXdwDNbqLR/jyPLg9wI
         gJZcB1qM42+tTsOvlgaszy9uNgcpEUiXfY8xo3RHrT/iw7ht4ycY8f91tb+1QUmcMjoG
         x7NQhxppBm/Ub/DIcjppknybwZsOxePGRhP9t2J4ufJFeeQNdrHwMWmb2Db857ADZZzX
         e4udsaOGtDe9VTlMdi23Nh9w8/NDOvL3L7Rx/weB6PaFndWs8q6pkJO5FuuMHDhz5xBH
         2CIehBWOGHhmJp6k3qavFUAFiHuhoxIEWr1Lp1d7DT6Jxgctse7laiEW5JlKPg5Yy2Mw
         YQOQ==
X-Gm-Message-State: ACgBeo0+ARPC2DVrDkogHVxQ21Mud4vCFZvfmaT9lxFGTjBl4iNxy4H3
	4QQiBrbRoJVcqc1nD0NQvvKlBy24knWUpBBONJ5O5w==
X-Google-Smtp-Source: AA6agR7JGTS75eRLb3PpWY05edC4/z5G8WRhg3NMJzHeWfFvV+hZJIJ99SEIAlSxZ00vAdN1IrpEj4h4o4KGIuJ5bqw=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr7629025lfr.647.1659984455809; Mon, 08
 Aug 2022 11:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1652074503.git.christophe.leroy@csgroup.eu> <96f53c237316dab4b1b8c682685266faa92da816.1652074503.git.christophe.leroy@csgroup.eu>
In-Reply-To: <96f53c237316dab4b1b8c682685266faa92da816.1652074503.git.christophe.leroy@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 8 Aug 2022 11:47:24 -0700
Message-ID: <CAKwvOd=VBnx63Gj1vTH-8tR50Zd1r50x+NS8JRc4nXARaC2FcQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Cc: llvm@lists.linux.dev, nathan@kernel.org, omosnacek@gmail.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Christ...that's not what I meant to send; sorry, mutt is giving me
bizarro errors today so I can't insert myself into threads using the
usual incantation I have in the past.  What I meant to send was:

Christophe,
Ondrej reported a regression with ftrace when building w/ clang
bisected to this commit. Can you PTAL?
https://github.com/ClangBuiltLinux/linux/issues/1682

Thanks,
~Nick
