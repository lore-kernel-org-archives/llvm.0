Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84527C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:18:48 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id j4-20020a170902da8400b00168b0b2341dso964911plx.5
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HlrKEzC+OauxSUT5xZtPYeK0f3N3z3B8pf9PvEyK7vc=;
        b=qNUPK/S5iHdXgPK57Bkixsq++QOQQMHfyV6r2MtPs7v9I3SUg8azHVdlWi+Vmpdk0V
         e9swXJWEpf/dXShWMQkD9tdieecIjQpQiuIyNIyGp6c4DhP+OHtn6lVN3Jb0aUWnt0zX
         6WRDoSX5skQyQJy1DXGgbB1frbSREBbKFeP8ovCXNP1nwpzQihNeuZDVsxzVVQEW/FTO
         oasKzV38q06qXK4hlfrcDIvuu6az9YMh+LOMOYwAEM/GaKPtPsyF6cfogObTYmCvxbsF
         HDhlFK8BOzg5MG7pql3z3B69jG4uxkigcwMhH0FMhZG9+AiHWiMvxTL/b/XFzI/yrt60
         XE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HlrKEzC+OauxSUT5xZtPYeK0f3N3z3B8pf9PvEyK7vc=;
        b=5heNmSnLFj0IKE8ljz3oGnFwy7JoTpB312Ek/AMcyuac0cNAwBQSeowxYquPQDQgsC
         gagR/vz9EzNqicuqMtKiqqinwE7U4cLG8f+4V44eJIVjOObxIxMFy2RPfD1qvo5Pt6rB
         1J6gFQ8PEdX7qi5+v+rfIWf+YTEpbOxki9cmiCXjy/UvUOYk5r707xidzsprn1F9G2S9
         Uqjeo+VrfP2zyqS3/Nq5FRryNwFFD5Ix+YfjNQ6sZTS8XhteE1+kd8ufTuBToyeTvpBa
         MUrvjizp6YV9AjOYhmCGLVR1SBxGYLP4/5v3m3aBPEphbIof0i4j5jkv7b229oggd2IE
         ZeAg==
X-Gm-Message-State: AOAM530gEd2zxUTh6Vn5aTA8XE0KU8herdvBDAcJ16F1ovkZBr6skq8E
	fkvkmblgTCB//k+vVdADLNUPMiuX
X-Google-Smtp-Source: ABdhPJxktSZZjGsZMg+ncs7oCo7UsGcqz2MItXnZVpN7aAWxKCb/sSBN71lrVJLJ6nxui+334t4TDARu1w==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:5924:0:b0:3fb:a75e:9e8a with SMTP id
 n36-20020a635924000000b003fba75e9e8amr36694755pgb.394.1654813127925; Thu, 09
 Jun 2022 15:18:47 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:23 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-5-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 04/12] blk-cgroup: use correct format characters
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

mm/backing-dev.c:880:57: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
                                                               ^~~~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 mm/backing-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index ff60bd7d74e0..7b7786dceff3 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -877,7 +877,7 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
 		return 0;
 
 	vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
-	dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
+	dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, "%s", bdi->dev_name);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-- 
2.36.1.255.ge46751e96f-goog

