Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157DDEA0
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 01:19:12 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 11so1261202ybu.0
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 18:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ueaMAy0ULQXZkazcTVS3d2242HyoqlSUdmi5cz1KhEY=;
        b=2Mt6yNsnrZPEinKH6mHqXZdU5KYXoTdY895oKYgluxpESE5KP391NHW9GzhSZ+nbFG
         yuhpyV+mqaqU06Kdw6do/x3hE4vYyQSo3+L2Cu2Paz//BvtMcnkfxBCZ/OdtQTMbIeH8
         galPZQ5POfRRE7XvQW1l4BoORMxPlnVbM+Xjo/6dNCaUfkMc866vuJfqB0+Ap0aCDIso
         LCwA10v+vLipNuiyoWGZlQo0rggBaB3nQ7l7g3SRXaVQnOVP6pc/J2WoWGW9lWagW4EV
         CC8MKpI40/MMEyDaOe7BAJ0KCYRbnttac6B2TdD+wAWEXPh/i1R5Uep/xJYOmsdkF3a9
         53uw==
X-Gm-Message-State: ACgBeo300HNXUqmqRF2U1xKBg6g1l+yvg2smWROfd3pqSLt3Fop+ECKR
	+R+jNWJfOk98NFJ+MDvyccxKhID4mV518VMYeEg=
X-Google-Smtp-Source: AA6agR56eWPZZgZXhHE8+UymN7vbahfHkIj+3WZnQbGp9SGVdxxxFcRy7/EqFd2T34smijqy8pq+bc3zPUahaBRooBk=
X-Received: by 2002:a25:6a56:0:b0:694:52ad:aab6 with SMTP id
 f83-20020a256a56000000b0069452adaab6mr7186184ybc.151.1662081552016; Thu, 01
 Sep 2022 18:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220831075742.295-1-mailhol.vincent@wanadoo.fr> <Yw8hJS9f6SofG4/6@yury-laptop>
In-Reply-To: <Yw8hJS9f6SofG4/6@yury-laptop>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 2 Sep 2022 10:19:00 +0900
Message-ID: <CAMZ6RqJJZSsnd8e=WATDVN2S2gFq1h-iCNstaakUXSubWP+img@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Yury Norov <yury.norov@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue. 31 Aug 2022 at 17:51, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Aug 31, 2022 at 04:57:40PM +0900, Vincent Mailhol wrote:
(...)
> Please keep me in loop in case of new versions.

A side comment, but if you want not to miss such discussion again in
the future, why not do this?

diff --git a/MAINTAINERS b/MAINTAINERS
index 56af0182a93b..f6caf4252799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3602,6 +3602,7 @@ M:        Yury Norov <yury.norov@gmail.com>
 R:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
 S:     Maintained
+F:     arch/*/include/asm/bitops.h
 F:     include/linux/bitmap.h
 F:     include/linux/cpumask.h
 F:     include/linux/find.h

N.B. this is just a suggestion, please feel free to discard it.

> Thanks,
> Yury
