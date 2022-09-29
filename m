Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E0410F7
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 07:01:51 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id lh5so819768ejb.10
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=zmbXriehZST5wK7cmCdFWN0bk9XDgfhPqDEbpKUatxo=;
        b=ZvnRW41heHvp1qflvb4jaTE5Eh8nioSgNqdXM9UsRMpnjyBwWr22BqJUV8vVSnOHZT
         TJOZpIcbcXSQnEYfd4BKEYPMHiiykHi+A+SAItusOcqZmoWyCFLz4/zDmQyb6lZRmSZm
         FDiwt9A/kcS4rIe+ftqEVx+AW13N25NYDX0HDBYCrlvQDqTg/aL/nt4jRVzTO97xFv7U
         3NR20zYi732g0WDuqDhoWQulZ9l9BXpK7bwYeX53hodsvve/7XxaxBv+0pRXMfXt2/gI
         na9RX8IhpMGvOy3w90bQc1uJb9u46ZlomYdy7h/MXzFXkmYX36PDswKgLqAF2siWzncD
         N6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zmbXriehZST5wK7cmCdFWN0bk9XDgfhPqDEbpKUatxo=;
        b=apKyxvja2+HQsqOXOO59WmvF8s2gsqil41JYJwWFRZAGeXyidA4GhyJj8wbKh9tyRo
         HXJfMGyDs+VVvi5idAkQOLr6kozDq1anDGDHwaWYqN+fBecIvEKRsE67NrMEliiWwFUc
         NNgM9TKOOJ6cR9avIDAjvpuXCHhC4eKK6xRCT5mSWOba+ogL8DysgbMXTrW4WCbLIOzo
         tevort5FIFkfwUIp19PyY0WfAiAa3dYQ92RbLOjep2FqUr6bcA50tvetHsZ8lhBMXfYA
         f+VF3mh0+E9mszggznqHrX8FX/jhHRoSxhqrpslV7PSjfdCU3BM3dQqOYefSsoR8uRhq
         oXWQ==
X-Gm-Message-State: ACrzQf29x/8Az8EeXRK2t6ythLTpDX31CLBKaa3vUMm073y6KrQevBXj
	HmUt7tclXBbdXkI/D0Empqc=
X-Google-Smtp-Source: AMsMyM72qWqN0KZKw1TyeWCmIHQCia3M4te2pOb6a0X8GypGreFfLajwwHWvlR/edZ0F1ZG3WVZQ5A==
X-Received: by 2002:a17:906:794f:b0:781:dbee:4256 with SMTP id l15-20020a170906794f00b00781dbee4256mr1497560ejo.404.1664434909897;
        Thu, 29 Sep 2022 00:01:49 -0700 (PDT)
Received: from gmail.com (1F2EF01B.nat.pool.telekom.hu. [31.46.240.27])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906539700b00738795e7d9bsm3443108ejo.2.2022.09.29.00.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:01:49 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Thu, 29 Sep 2022 09:01:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v4] x86, mem: move memmove to out of line assembler
Message-ID: <YzVC2p+RLDcnlC3a@gmail.com>
References: <CAKwvOdkaKTa2aiA90VzFrChNQM6O_ro+b7VWs=op70jx-DKaXA@mail.gmail.com>
 <20220928210512.642594-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928210512.642594-1-ndesaulniers@google.com>


* Nick Desaulniers <ndesaulniers@google.com> wrote:

> +	/* Test a backwards overlapping memmove first. 256 and 1024 are
> +	 * important for i386 to use rep movsl.
> +	 */

Nit, please use the customary (multi-line) comment style:

  /*
   * Comment .....
   * ...... goes here.
   */

specified in Documentation/CodingStyle.

Thanks,

        Ingo
