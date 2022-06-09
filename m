Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD7F7C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:19:56 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id i19-20020aa79093000000b0050d44b83506so12975955pfa.22
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qfaKip6DwFGW+guGsE2/HUgOUCf7B/ryBL2HyFI8yyY=;
        b=rmDrQmu6i0rMhVWryy+1sSregBQbx8EzAhxguI/zyywENeaveJeync1WHxdDli/I7V
         XVFwNwX1LL/Eb2t1qJzoo+LZL4V651eslhmMESIosQ4CzFZqJ/XMZIcgfWh+ijuJ9S4U
         DE9dfzo5xGMJQHKyVBlVHIJPFhw5ayon8gNdeY1wYxrm/5naZOHI7yvxx4lN8IU/5Vsd
         Jrf74AJMKR+h5WOopQkEY05HkO30nH18xX4D85TjTMQIbL0iAHDhYHUPur2amaBP1CL6
         RS8eMppIKQevbuQilaLP804yNxwZ9Wuv+YrNiMwDfjRjNIKBMBVfcgDhrLJV95/xQEbr
         74gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qfaKip6DwFGW+guGsE2/HUgOUCf7B/ryBL2HyFI8yyY=;
        b=pqBeVfsSYCUTJMKik06sAfyaJlyOvQIOGIw/SdFpAXWbv9gjlH2ahwFI/I7Mxui0nd
         sXwvvDiDYGL7oBs6dHu31xmNRT2hGV2RSobj10PwbkF2jihunIwF0teAoHVDsucCuLro
         Eq7HLRdt3q8NtoQ3YF/tTM/9ClI+qk8JpstGodGA5R2hm8mKM9kpUE1XK5l8ZDFKSl/i
         ZNX6G+qAqnfUD+PEpG7ym3vFLoCUleE1REJ9VUA8FsFSNXTwhQHOOFJ8KxwKSfsxQ4Ae
         rFHHGQ2nwMXcGRhrSlnl7QZjecrYva7BKilxAYdZ64C/JPRthXXHg9FywfFi9zB1uVgW
         Wefw==
X-Gm-Message-State: AOAM530t6eTtP7E2weTS7xd1el38qVWjeLVX2j+eC0neN2UYHTl3NrnA
	QbxI3x8xOjUfsRiBFHue58iHSnZE
X-Google-Smtp-Source: ABdhPJzfxk5qZb5y/5tpnB1EFv7CAi9wKZuC1KM7/pyahvYM5X1dHlQAhdkQ2HW7pda2hCN2ocO+yxStMQ==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a62:1687:0:b0:50d:3364:46d4 with SMTP id
 129-20020a621687000000b0050d336446d4mr42409947pfw.74.1654813195848; Thu, 09
 Jun 2022 15:19:55 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:26 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-8-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 07/12] driver/char: use correct format characters
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
	Daniel Kiper <daniel.kiper@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, alsa-devel@alsa-project.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Bill Wendling <isanbard@gmail.com>

When compiling with -Wformat, clang emits the following warnings:

drivers/char/mem.c:775:16: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                              NULL, devlist[minor].name);
                                    ^~~~~~~~~~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 drivers/char/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 84ca98ed1dad..32d821ba9e4d 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -772,7 +772,7 @@ static int __init chr_dev_init(void)
 			continue;
 
 		device_create(mem_class, NULL, MKDEV(MEM_MAJOR, minor),
-			      NULL, devlist[minor].name);
+			      NULL, "%s", devlist[minor].name);
 	}
 
 	return tty_init();
-- 
2.36.1.255.ge46751e96f-goog

