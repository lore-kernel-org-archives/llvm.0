Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4A5C82
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:45:29 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id p12-20020a259e8c000000b006958480b858so8395624ybq.12
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=UPrLPANI270ughyuxViugAgaASicl0Pl0QAaTiYiZSU=;
        b=R1Le7k+VwrXVecUa6OZKaJ79w//eIJLti1Jyw+PUIhDm0w+ec3Z4KpM08qMUq4J4Ih
         X1dA2kBrdB748En0e3hNxPuYHE4gpDmIgmyCX0efxNdXvhAZ0x0q+plG9EP6I+HfGq/x
         DzRvhIM0lYe93sfYf2e9aJIe/JUODjYK7PUBI+vbg86M4eNF0mdH/eOJlyKQwre7tVo7
         ywKdDiMqiOsdv7qoLguoncmJY0TwP++H3CeoYv6FSBwVnGk5HLFKuI4aofaU5cfJtHXg
         k/fYJVUKlDh4EFjmieSJ2Tcw/Z1uNnFkggPx0ncAl/XPANWG26uBgcB7S1b12vCwe4XO
         EbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=UPrLPANI270ughyuxViugAgaASicl0Pl0QAaTiYiZSU=;
        b=uHkLQTzX3UMafUwdNq384RmIoprc1QFTrJjb03YVmO6yOKm4BQ60IczYbNh89RKmn/
         cTtluoL3mhKF8OwYueYz3/MdeFQmAe/BWGqAENsOVO6tqg2Fzy64pGLA2WWYVm92mCCi
         +a1fZyelN7TozhgRacI6XX3xrg10teGdXVf08utkHKpj0qvhKa4UMYQIoTeUgWYjGI4c
         7LfSZH00pzd5Nynehk2NixAMchbnajFa9h8FN8Np2ozn3XJkftZZ0bLkwpD1V+J8olwM
         wsoIqStE4jENEc4q3nNswCYWWvmDHOJs5n8cp/KGZDow1GDQO4Mzo1hkI4SD2NIJcT6h
         BtiA==
X-Gm-Message-State: ACgBeo3aHjb34s8ddWH+L6CDin7uz8QyXMrLYl7lqYtn+H6wNOTUjgkI
	cO9PJITmUu81WxW6CRAYVcltc6417A==
X-Google-Smtp-Source: AA6agR7wl8T56FQKposQuML7IiGJlnt7l5akwYku8eHDk4YWCMC49E42ZZfegTNAPb5Nml37R59A5ESsEA==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a81:a093:0:b0:345:c52:945c with SMTP id
 x141-20020a81a093000000b003450c52945cmr23447907ywg.341.1663019128940; Mon, 12
 Sep 2022 14:45:28 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:45:20 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214523.929094-1-nhuck@google.com>
Subject: [PATCH] staging: octeon: Fix return type of cvm_oct_xmit and cvm_oct_xmit_pow
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cvm_oct_xmit and cvm_oct_xmit_pow should be changed
from int to netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/staging/octeon/ethernet-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 1ad94c5060b5..a36e36701c74 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -125,7 +125,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
  *
  * Returns Always returns NETDEV_TX_OK
  */
-int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	union cvmx_pko_command_word0 pko_command;
 	union cvmx_buf_ptr hw_buffer;
@@ -506,7 +506,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
  * @dev:    Device info structure
  * Returns Always returns zero
  */
-int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	void *packet_buffer;
-- 
2.37.2.789.g6183377224-goog

