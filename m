Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7527C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:19:11 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id h10-20020a170902f54a00b00166449db7f8so11527478plf.9
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fWdTUxWRVXkKLWYheGOI11e0mL2XAHFKbZxg8ksMoZM=;
        b=ezNDouTkewW/awvW/cRvKC6jHhcMBl4eQkJi6sdP+X2J6iJMkd00jA2jaRJhpFY7aw
         yxivdcEq++4iV1GgB2ziv1ayV3oP8FWg/GB0Zo4bN9LSRrIbKMWW4pYYedFNqaZbtBdq
         LI7orAiKEXNDUMTMRTz+eYmtPr0ihFSVRZhCMEgns7LQjXXffU9ysRs8Jm7/xp/mkHV8
         hqJ/WTn4IigfYhYdyyonY3s//N3eKAKkW8RZYgrVC9YsY682gIJn1c0bZa76vTplgKaA
         3OGnJiqbOGhiGk4PrcLnGinCbRAB3xGsfKwPwyZscTB2mgetoP8/LmB/5HB6hMrHCgU0
         s7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fWdTUxWRVXkKLWYheGOI11e0mL2XAHFKbZxg8ksMoZM=;
        b=KBBOwHppFh+ZcRE+VVitb6baC1JeVqHrPyqhh8+JbKPeriqnx27CNFv+UVtABe6C3K
         qWo7mci44KctxNBTUrd4+yhl3L+7bV9GoHhbjttXv6KsHLJQjHJ2L1oJldsPCaXb2h1/
         znshEvsbbcG2b1drQIwdFqSGTevwSdDPKGrPNUaRGCwQ1cGylf/ewRdBCYv2UVeCQEDi
         iH0jriRdhusKqXbZTmk61XhYNINofZ+sqxMw3RFU7FY6hwCyuOAel62ic492rHpE/vnu
         WD0mISvjZrhixO68/+bWzuIoIzlFG1rxskbasmD7S2c6PugEQEDfKRKGpF0bnTQf9kuh
         Bv8A==
X-Gm-Message-State: AOAM531rMjllwUI3AZhKDASqJvWGjEO8fCbqbg1gneW12W2ZNALWL2Fd
	ABWAAojpAh3yALUNuJC1c9cq1qBk
X-Google-Smtp-Source: ABdhPJymRh8XdI6qUr+0U3jn9BPA1WS3MroiwqAq54XxkobNI9HSYvmGC6qhWN+ZtdS8zin/gyNAdfGHUw==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:c5:0:b0:3fe:26a0:7abe with SMTP id
 188-20020a6300c5000000b003fe26a07abemr10973746pga.152.1654813150612; Thu, 09
 Jun 2022 15:19:10 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:24 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-6-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 05/12] fs: quota: use correct format characters
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

fs/quota/dquot.c:206:22: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                    request_module(module_names[qm].qm_mod_name))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 fs/quota/dquot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index a74aef99bd3d..3b613de3b371 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -203,7 +203,7 @@ static struct quota_format_type *find_quota_format(int id)
 			     module_names[qm].qm_fmt_id != id; qm++)
 			;
 		if (!module_names[qm].qm_fmt_id ||
-		    request_module(module_names[qm].qm_mod_name))
+		    request_module("%s", module_names[qm].qm_mod_name))
 			return NULL;
 
 		spin_lock(&dq_list_lock);
-- 
2.36.1.255.ge46751e96f-goog

