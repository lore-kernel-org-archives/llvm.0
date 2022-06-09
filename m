Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E97C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:20:18 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id h190-20020a636cc7000000b003fd5d5452cfso7947351pgc.8
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dB/VRnBqrla/uo3hQxagOMwn8rw3rKKNrg8KvvIMmrs=;
        b=NA8rGIzS2Lo/FSyJFJSopJzo3vj2qG+W/JBu2Td+wh8lNm3aGHNFbCPALJTDiKY3VZ
         BXYoT+Ww8rgiNjDcWDo8JWEIvIa789ch4uJ/akkx61GHrCbS4UYTLU+WBzXi0U6zqFg6
         WETSd0zF9UD0yrUhECgMgO4+3B7vaNDE5q4OxsAILit4vZz26MEF5lP7eGpObNUfQYZP
         qWyriCnElNMS5dBnlp4ECfJw4cwUWsda0JPVGIsCkMRh996FjTM9tl6X5Bjcl49Ex3bX
         056kN/4A+KMGFsvjat6Zhxnibo6NVJe0KQfbbqHffKzcdpAaOGAQ/5H1gcLRSIgsdnQd
         eZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dB/VRnBqrla/uo3hQxagOMwn8rw3rKKNrg8KvvIMmrs=;
        b=jok78Qn+3FImOMuz7VoinNFDFu/e0knyVjxz85+WXWQ9sPaWt5aY9ULYERnICYHWCF
         RLgJx+LjanPJjThGTBR2OaF0S1nE6b/mqPiJd/O0UcryiljAoZSU0QGeMtgTvJtdtz4n
         G2t+fYjLmvkNGXQs3KSVP9B8aoWPs37HueiIsMgCLpebLslxkrPECRQFuYtuDuUWrmsh
         9QQeaNL8uCbZohjVSokSIVvyQivmqP9WpG0i7+XrnqLV4UqsJ5xyVpcdpC3pGvc/AiMb
         wyQEMLnbC/LH9niC0T/OG6rddUZ1PgFgpBIULk68mheR+DjS56wrYTN2AfkA4lXkQzNm
         ED2g==
X-Gm-Message-State: AOAM533uTF1JmB3NpbzfnQ0yCQmAdZRAeY5QBQZcANoVY6gv9/pfL7FA
	yUt4XYZ+m0e3FeJ6qLXtRbNgcmIN
X-Google-Smtp-Source: ABdhPJye2mFQrzIepKAqLUDnC7IYTgWuIi+7I2qa8DRzQUgLX+2gR0oj+bp3uxnl8nOmUO9s5APs/msqoQ==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a62:e919:0:b0:51e:7b6e:5a3b with SMTP id
 j25-20020a62e919000000b0051e7b6e5a3bmr1529888pfh.78.1654813218119; Thu, 09
 Jun 2022 15:20:18 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:27 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-9-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 08/12] cdrom: use correct format characters
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

drivers/cdrom/cdrom.c:3454:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        ret = scnprintf(info + *pos, max_size - *pos, header);
                                                      ^~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 drivers/cdrom/cdrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index 416f723a2dbb..52b40120c76e 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -3451,7 +3451,7 @@ static int cdrom_print_info(const char *header, int val, char *info,
 	struct cdrom_device_info *cdi;
 	int ret;
 
-	ret = scnprintf(info + *pos, max_size - *pos, header);
+	ret = scnprintf(info + *pos, max_size - *pos, "%s", header);
 	if (!ret)
 		return 1;
 
-- 
2.36.1.255.ge46751e96f-goog

