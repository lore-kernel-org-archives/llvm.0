Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579537C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 22:21:50 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31384ac6813so39884527b3.8
        for <llvm@lists.linux.dev>; Thu, 09 Jun 2022 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yboyFArx2lHvBt01l8NpldAEI3xLVVvkRY3YCO31PQs=;
        b=E9tSuZ6hKkd5R9UrAClvzMvLuSapw21MRvFh9K5m/Q4W/Ne6NP2WMWfSPzasz8wKZX
         Mng11d6Obxtbq83lWoSaFsdBiVCu3gb6X9dNoHMi3E7qOKWwZUm9cJAU6WOY5s+S4WcD
         k0KWGk2jmTkZOAqD94Ix96O/6kgOmQ/r+QpHomefwKvJ5cV0MNofmxceF2lXxoFWF6gg
         j5Cs7IkuMhKv2Pf+5++JwO5hcoMx6SP3if8FmA4NjIla9U/uK2//v1BfU0Tfe7AV8KrT
         Ey/sE8DleSJieRPHEDBL1hPn4naIWW02H/aWpnYArbukY4zZLmv4GV2t/e5g12dM+Qzj
         ZcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yboyFArx2lHvBt01l8NpldAEI3xLVVvkRY3YCO31PQs=;
        b=jbRzZBDndSVeVioX8AW5nAqo7dzJ+wpxjFoiCu9FqLHJCpb7KgDji1FQB7l9Z6mfCE
         hm64E5hoRzQCRr06RFDYnRbVrvMDdRfi+tNJ5XKEWeja67o9icds+ZOkS5GDBOn4QHa5
         uyIJca6uqoRHFRpZ07nROroUHg3ylTx1mfLqLhRzxRveCz+v42OzYwoxXOulRMSNJkNq
         Tyb1EBH6g7PHaZ38EjBylZ2kO6vC9K1iS7usvTZg7ZI6U4/hWjyammbUB+IFufgpgn5h
         48vlxQG1YAQ+2hbZ0GMzmr4uMqh+xdfQVEA8X4k1yGRxeRSdoIdiPB9qksqaFW6iprTK
         UinQ==
X-Gm-Message-State: AOAM5323ohxSYdOwCgSY3L/OHu7Hq8wuHfuTx/eWRi6M7Njuzim/UVxB
	ItQN6zNV9TXweukJkh2FahZkWxdn
X-Google-Smtp-Source: ABdhPJzx/fiV7355Fpicwsezz0b2tB8XbCEkcbb8KPwyuPviI/0AOw7BwG+AXnNZJgmFqRPAiS2WX3p4fQ==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a81:c248:0:b0:313:3c2c:89cd with SMTP id
 t8-20020a81c248000000b003133c2c89cdmr17003210ywg.175.1654813309307; Thu, 09
 Jun 2022 15:21:49 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:31 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-13-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 12/12] netfilter: conntrack: use correct format characters
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

net/netfilter/nf_conntrack_helper.c:168:18: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                request_module(mod_name);
                               ^~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 net/netfilter/nf_conntrack_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_helper.c b/net/netfilter/nf_conntrack_helper.c
index c12a87ebc3ee..1e0424d37abc 100644
--- a/net/netfilter/nf_conntrack_helper.c
+++ b/net/netfilter/nf_conntrack_helper.c
@@ -165,7 +165,7 @@ nf_nat_helper_try_module_get(const char *name, u16 l3num, u8 protonum)
 	if (!nat) {
 		snprintf(mod_name, sizeof(mod_name), "%s", h->nat_mod_name);
 		rcu_read_unlock();
-		request_module(mod_name);
+		request_module("%s", mod_name);
 
 		rcu_read_lock();
 		nat = nf_conntrack_nat_helper_find(mod_name);
-- 
2.36.1.255.ge46751e96f-goog

