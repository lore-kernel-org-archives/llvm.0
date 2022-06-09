Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10797C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:21:27 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id s2-20020a17090302c200b00158ea215fa2so13458774plk.3
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+JW2n6LLjgkLeZpu0VrK7uVIniA8Omo9w9YQRrZ1ImQ=;
        b=i42901GYNhaxsHQ0DOGoOky9iCPlDaMMKrye+1S6wrdYfiDoHAZcC7HTQX/ufq8JDc
         FtLJH8ibG+4hcwJncrABH5MINqNlaiBQcg6AiUjnTwqlf664IuYPp0tvgNpDNS6s/GjQ
         Wjh2TOa/isNuXc04yhOdZrj9wIAtXkGMKkDBH370v2doh3glFP/6lvE9gZpbXECpN/zv
         UStKebGupQmmTtj2yMjnHwJiwJi/peKu25pYf9NTE11Ch6upWSa6FAa3CkIKEN5+Emo5
         3UDTgqdqaohZKI3Gp3XYmJjjv1YwnDPf8AUi3y1kFAWlFzS3PLERdXTH2sKpk0ltR6ij
         /vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+JW2n6LLjgkLeZpu0VrK7uVIniA8Omo9w9YQRrZ1ImQ=;
        b=XMV+Ww3VWPBqDAc1KoVaJT+nlq0qDF5MLWu8rZllYsCfzgAUrhbYOJL84qQGr406XU
         d6r0C53NXnurbWkOrxOFPtfNz6gn3pm3iAv7llM7zx4L2JpuFW8XXJAgpg5s/SILWaJE
         qHRc8uyDhKCGhPI4wI+KdXP47rc2Fo0+3ejKVCuFHgF/bF6ast04BGpP9OlpRTwrhKrz
         kRxKGLp3D5iMj5QFerXRpPpyhy//7EESycU/6s3sUMGHcIw+7vFLa1rJiVd96aJTjexw
         Ms4Wh2GiFGNbng7rTm0qjqmsKmrSFyG/xx3omOSwtgVPLoDcVu9e0YstikdYxYKcJps3
         CqPg==
X-Gm-Message-State: AOAM532fdK+wOp2MeFrhcAFricfcqfiLF3c3r4j8scsaIkqGwZrrkBDd
	iHIvWVRCTv0JS3voVQxH86FosctF
X-Google-Smtp-Source: ABdhPJxwIiVK0GwVN12g3ZMNH56OyPQzBgCjPEweYrbMYHqEsJdgXTONzisCGHUJLebHzTiLq5Vb6Q5FXg==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:409:0:b0:3fd:77f0:9a75 with SMTP id
 9-20020a630409000000b003fd77f09a75mr25262295pge.149.1654813287223; Thu, 09
 Jun 2022 15:21:27 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:30 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-12-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 11/12] ALSA: control: use correct format characters
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

sound/core/control.c:2062:24: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        return request_module(module_name);
                              ^~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..a1778137147d 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2059,7 +2059,7 @@ int snd_ctl_request_layer(const char *module_name)
 	up_read(&snd_ctl_layer_rwsem);
 	if (lops)
 		return 0;
-	return request_module(module_name);
+	return request_module("%s", module_name);
 }
 EXPORT_SYMBOL_GPL(snd_ctl_request_layer);
 
-- 
2.36.1.255.ge46751e96f-goog

