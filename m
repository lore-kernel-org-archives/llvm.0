Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381C7A
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 20:28:01 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso3075647pja.2
        for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yMCklTCfBEfu1+s01fVuvmfQuZAk4CVG1//MJ4TRqY8=;
        b=V9exO7kqwC3fJwLiBdLMNh7e2NTzSQPXYlgtV/Gr15Ud7DWzNv4ABtfWWzkYx6I0d0
         jAE87FSYs1r/hE1VEXszBB3otRDLkzTSY2oD5gVjSL+dr+xqDOWYRbrI8Mza3mLBu9xS
         i1W019LbMw4Eqn/kHzng56gm7n//xzDVnp5qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yMCklTCfBEfu1+s01fVuvmfQuZAk4CVG1//MJ4TRqY8=;
        b=mCmWnt0245k7+Eeitlw2l95+0yhe0ACVRzcC0aUKz/D+4cOzkHmf8A/7a6OVHqHeh0
         n58WpFz/yVcEky4Nl/hsz10XsEnTFcz1I+ZgKF1aVir+3NSQ4mX4WCOuS4wXl6Pk4ub+
         pVglspiuD/+F2L1rn0BTA4YX4L5DBvtApq/vL54IsYYKV3QYhPsrZo0bGbYGHNUg6n+r
         lQiHgpFYsv8Sqh6EpnlSpsXShp95sD370OS94BaShZMLmPuefc7TYi0UpyNrU1Ijg6kq
         y7KndKEjb2gpMRYvmpwNz4c6MJWkaPSMD7zHn/WSNA1Ciu0+HJqg43SM4NUyFxPwdr6S
         tRxA==
X-Gm-Message-State: AJIora+lprrnVhuG0HWsPfJmsETbCwkecvB8xJZ12v6CdGYCogrKbm9W
	MiznZ8whXE56r+sekDj95vN+wg==
X-Google-Smtp-Source: AGRyM1uu5Dj1T24l5+1U0VQ9oLk+j18+zuRzHRA+X9Uf9ODZyTJweqIyHMLMG/GPb6MqP4jTJFW+aw==
X-Received: by 2002:a17:90b:4ac1:b0:1e6:7c82:9aee with SMTP id mh1-20020a17090b4ac100b001e67c829aeemr12042611pjb.234.1655324881349;
        Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x15-20020a63b34f000000b003fe28130b12sm10146453pgt.62.2022.06.15.13.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
Date: Wed, 15 Jun 2022 13:28:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Contextual conflict between kspp and rcu trees
Message-ID: <202206151326.E34CDE453@keescook>
References: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>

On Wed, Jun 15, 2022 at 12:55:53PM -0700, Nathan Chancellor wrote:
> Per the above RCU commit and commit 6c5218715286 ("context_tracking:
> Take IRQ eqs entrypoints over RCU"), it appears that the following diff
> is the proper fix up. Would you mind applying it to the merge of
> whichever tree comes second if possible? I did build and boot test it
> but it would not be a bad idea for Sami and Frederic to verify that it
> is correct so that Kees/Paul can mention it to Linus :)

Actually, the CFI fix (and a few others) are meant to be sent for
-rc3, so if the ct_irq_enter() change is in -next, this can maybe get
sorted out?

-- 
Kees Cook
