Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E77C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:21:03 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id s23-20020a257717000000b00660719d9f2fso17390462ybc.23
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=v4Xn62a8gwv09PX197f2KX5K6c68JUg+Unaoh5Rs3zU=;
        b=rIM31hja6TacLFy83ekGaYY6NocbE3+qp06k1AYSWqT3YCOM3vKnexoLoVRg3/QFrC
         NK6lDPMraatUaGV4ysDVq7Ma73A8ej30mShvcnMynXPj4q1s4HwLXHsyE5NReacxVqEF
         SN/r5DNjRMP1h9Yx1PS5+t5PqoRBJ1DmF1KeRqex3FpyMoNRbYlXt2tQwLA6Cftv+3aS
         xU6s22QmO1Pl1Kwrbe6vsMz+d3Z4FRfHNfEK9twj222QTX3BVZNBOKgun1MV8xBDAQQA
         +IscNJZzBGaDfdE3Gg++zvAyvxAsnUQ0EJis1knVDwKv7m2aWEOPArINp5NiPyNi+Z2n
         h4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=v4Xn62a8gwv09PX197f2KX5K6c68JUg+Unaoh5Rs3zU=;
        b=tlYxGUhDiWbiWA61HsIOWNqYpB1D5dKw+gXTjzhSHBDDau+T8Wmu50xvfsoYyGFIBp
         ksdMh2IERwucg4uu+HIRZnn2bPZCCXyN37eQWEVn/fnhV1XpIcW9ZeB+N79i3YEcRzhX
         AB9tRsR3KThcZqrr0AZujIKXHCfR1N/efDqqTscKdTZlHSsQB9KcnUmLG8yuUBD1/X9I
         kDluLwGklzaiLBvrSOn5deRRhECFLKpIiwOQdqKCQQC9OWFUoLVybrqKpykWE74TuekZ
         c+M/JFsBjhOdCfu0qxhDIfDIb3ea9uYPmwx6onaghyO8aT1w5ReV5/oA1cHG6IPbyMTv
         J4xg==
X-Gm-Message-State: AOAM533TbHONepqa3kL5bPRcwConWo2KqhuXKCEmTUkjpO55kOgq7zhb
	QXe59fJDRKUYOvR9HzVIW+KZhf/v
X-Google-Smtp-Source: ABdhPJwSDxouzP8D6734EA8fpYrXSwixl1FJKKaGzKk8Ee6TEpQt79esVExDoO3PJGM+WWqOyJq6+ArWEg==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a25:76d5:0:b0:663:ad77:8d48 with SMTP id
 r204-20020a2576d5000000b00663ad778d48mr18678005ybc.633.1654813262959; Thu, 09
 Jun 2022 15:21:02 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:29 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-11-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 10/12] ALSA: seq: use correct format characters
From: Bill Wendling <morbo@google.com>
To: isanbard@gmail.com
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Phillip Potter <phil@philpotter.co.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jan Kara <jack@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ross Philipson <ross.philipson@oracle.com>, Daniel Kiper <daniel.kiper@oracle.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, alsa-devel@alsa-project.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Bill Wendling <isanbard@gmail.com>

When compiling with -Wformat, clang emits the following warnings:

sound/core/sound.c:79:17: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        request_module(str);
                       ^~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 sound/core/sound.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index df5571d98629..7866f29621bf 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -76,7 +76,7 @@ static void snd_request_other(int minor)
 	case SNDRV_MINOR_TIMER:		str = "snd-timer";	break;
 	default:			return;
 	}
-	request_module(str);
+	request_module("%s", str);
 }
 
 #endif	/* modular kernel */
-- 
2.36.1.255.ge46751e96f-goog

