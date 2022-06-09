Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3437C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:20:41 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id i8-20020a170902c94800b0016517194819so13338059pla.7
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=25alQ5NbvDA/tAT/crdGxszOxkEet+uV+RiKp6teCtQ=;
        b=oZfJo/SXd3Qwc4Nv44GXKhWDAFTO95PgXKfM9e9BiPA93gnZilAa51s/ZcMgeZyQDX
         bdQWpsU2Iq0YRK8nhoojrl6Ovztg/h1fX8YAfPzB2dwLHljaWKbdC8Mk4yXY/4KToKYJ
         ovK2hyHWLN7o69TaNinVFAZmPIf4qo8PHxZBtzNCHZvyhMz5aDyGPm8IzfmTRY3xhkY5
         HV52VK6dmyAZeje85nLNYwU1K6dOCF/suK14Mfn4D1Y16vY/jjL7/9lAyFEiDPQ1QSGP
         J6zMvdrdFc5DFPuif5nPyA2QWjOTwZ7NUnTVPFwq/IivldY6hoaIhzn4fUtrg8kNe7N/
         zK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=25alQ5NbvDA/tAT/crdGxszOxkEet+uV+RiKp6teCtQ=;
        b=MVC0gjgTSEgKGKZnUpaWy1j8bmWQ6jCx4pxPdMVCGOBbOU72JZ1re/0E4HfqoEMYSe
         ICRgEOEy8MHj7s+7605HhK51IZzjzOSToYXrpAaijZM9FZSPu1sOdbAm2Nl2QAiRv6M3
         uuLAu10S/bKQQTXpkR7Lj1Jkcpx9pwhlkV/lCoKvW5HE3E6tW22pjCilWgqfSIjR+WHL
         NdwAvV6uoYYZogVYXsA+9U75tE95knwK47jbgNl1pPKWzDwowkThcyW4h1menkmfARCV
         QZNNFRCaAwp55erba5TP/sgppCF5nYaDc5+s5uP//fFoESjIfcjnB6cW/Abp1gyLvQ9H
         5JeA==
X-Gm-Message-State: AOAM532jiZG1K9Ve2eTDSP8Zk6OsCfF/Q1G//yWrIplcf3G8yjBHAWTY
	yO13M6Lb1NtnNNKOnfKeH9Y8wc8x
X-Google-Smtp-Source: ABdhPJw9W1H1jWw/58e5xPpEUFA37qKciU2RFZ0YGfr9UAt18WH9PywE6TBxCqfkRuUXpq4m2jNc2xi7ug==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a17:902:cf06:b0:161:53b6:474d with SMTP id
 i6-20020a170902cf0600b0016153b6474dmr41957402plg.63.1654813240658; Thu, 09
 Jun 2022 15:20:40 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:28 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-10-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 09/12] ALSA: seq: use correct format characters
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

sound/core/seq/seq_clientmgr.c:2414:22: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        snd_iprintf(buffer, msg);
                            ^~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 sound/core/seq/seq_clientmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 2e9d695d336c..2340f3e14eeb 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2411,7 +2411,7 @@ static void snd_seq_info_dump_subscribers(struct snd_info_buffer *buffer,
 		up_read(&group->list_mutex);
 		return;
 	}
-	snd_iprintf(buffer, msg);
+	snd_iprintf(buffer, "%s", msg);
 	list_for_each(p, &group->list_head) {
 		if (is_src)
 			s = list_entry(p, struct snd_seq_subscribers, src_list);
-- 
2.36.1.255.ge46751e96f-goog

