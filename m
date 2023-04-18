Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8F2573
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 20:36:13 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id fg9so9793382qtb.1
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1681850173; x=1684442173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zb5oGrl4JjIvT1aq7E8aKQwDzSKWDYgsCqiEnJYeKrU=;
        b=VDVEcSalZCQ/nQUEWR3rxtHo1TM3Evb7f69OLiWAnFX63oGNxKeyoPPLHjSUoZM4iE
         pt81IDLvIdP//qmZ/pau7vj+Ev+KbstX/vIU/igzKH8019XOB0jalG9lfO1LwUayTtXo
         rdjrEeO/jxtZLpFkRel4f8SgqGTdT8kg+njFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681850173; x=1684442173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zb5oGrl4JjIvT1aq7E8aKQwDzSKWDYgsCqiEnJYeKrU=;
        b=D01sG5V344iyGqL7oT0oOUgGnlB/iJBS0IiKKnUsdK+l7+I5v4kQVZuh27exSEth9+
         nnqMEe4+02IwKCrBPuc5hSD+30qyyTPfO4sAfJiATMH60gxhwb3yDbOE7PaMvA+M8act
         AQ+fPzzDtuuRZ5EFPC374TVfkCH3XHIJj2fQh3guq4ojH+Hxqzn63+82tW5BOQRddk2F
         RB1K9mnrRo6uxZRzEX5h9CxEwcSOkP/a0ZHH6PZQwtPH3eWALVqv6QtfPaEVyk4zVa6V
         loXSzOPtURfK0verd4MQ0qOuRiNr5HU8o7wFKDVracjGqHq+nsp5u65enPZcn1GXnzhV
         NjaQ==
X-Gm-Message-State: AAQBX9d+2c/HRSuKedAgJrqOZDRILzQ5g5T4FvqHTf0M2BwW//lSDXEI
	oHM/ItAF9mTpuAi7ISqJofj3xA==
X-Google-Smtp-Source: AKy350YEIjV6EPfbO2RYZySHSVrGUNFVSRiCc0nQEO4SDy03ISls+oUqrpO7lv/I3pZG9ExW+iJ8mA==
X-Received: by 2002:ac8:5756:0:b0:3ef:3f4b:31b8 with SMTP id 22-20020ac85756000000b003ef3f4b31b8mr2176931qtx.7.1681850172894;
        Tue, 18 Apr 2023 13:36:12 -0700 (PDT)
Received: from localhost (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id q12-20020a05620a0c8c00b0074df7f62c83sm1429455qki.49.2023.04.18.13.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 13:36:12 -0700 (PDT)
Date: Tue, 18 Apr 2023 20:36:11 +0000
From: Joel Fernandes <joel@joelfernandes.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: rcu@vger.kernel.org, nathan@kernel.org, trix@redhat.com,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: clangd cannot handle tree_nocb.h
Message-ID: <20230418203611.GA3640630@google.com>
References: <20230414005309.GA2198310@google.com>
 <CAKwvOd=yQS+0oDC46Hc5D_V0JET8=xbQmAJrpBdg7c4i2EyqHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=yQS+0oDC46Hc5D_V0JET8=xbQmAJrpBdg7c4i2EyqHg@mail.gmail.com>

On Fri, Apr 14, 2023 at 03:47:51PM -0700, Nick Desaulniers wrote:
> On Thu, Apr 13, 2023 at 5:53 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> >
> > Hello!
> >
> > I have been trying to get clangd working properly with tree_nocb.h. clangd
> > trips quite badly when trying to build tree_nocb.h to generate ASTs.
> 
> Hi Joel,
> Thanks for the report.  What are you using clangd for? I'll bet
> something interesting.

Thanks for the response and sorry for the late reply. I am at the OSPM
conference. I use vim and vscode with clangd. In vim, YCM uses it to
highlight compiler errors live while editing, I am pretty happy with it so
far and has been a huge time saver. Enough that now I want to use it for
everything...

I first came across clangd when developing Chrome userspace code which is C++
:). In Chrome, ninja builds can be made to output compile_commands.json.
However, now I noticed the support in the kernel and was like, wow I need to
try it. Further, YCM seems to work much better with it than without :)

> I've never used it myself, so I don't know where to even begin with
> how to reproduce the issue.

Ah ok. :). When I ran get_maintainer on the script, your name popped up and
someone also suggested that you're the goto person for clang on the kernel
(which I kind of already knew ;)

> It might be worth filing a bug upstream at
> https://github.com/llvm/llvm-project/issues
> or internally under the component
> Language Platforms > C++ > Clang > Tools > Clangd
> with detailed steps to reproduce (and what the observed error actually
> is). Feel free to cc me, though I don't know the first thing about
> clangd.

Ok I will consider doing this if needed. One thing I do observe is lack of
good support for header files and it is a known clangd issue [1].

However, the fixes I was proposing can purely be done in the kernel itself
since all it'd require is generating compile_compands.json with the -D<macro>
and editing files to keep clangd happy. I guess one question is, how welcome
would such changes to header files be since they're for tooling and isn't
code that will be compiled outside of clangd.

(Linked issue may not directly related to what I'm saying)
[1] https://discourse.llvm.org/t/header-file-heuristics-issue/1749

Thanks.

