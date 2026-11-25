Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645381;
	b=VjulFnQCjXjV3YD6t29aJUYRqoyq9gzyclkUWFi7dQ57dZKbpt1cKzZ9Pus0L/9eNA1k
	 6PHAfCTiO/xx8qjT7F+dX5mEa0TBXCnRHenUxvwh0bXYMqekaHmkZV8j0g7r/QvqoSxvq
	 ZR4oWXG4MxiDfXDFex/uhrUnYfUvFdl1jc4QzIpun0xkFOzT6/QDbXSto1B8fNqDDysku
	 LErJycvju6DnfKHs7pCuO+P7kLmspbRfv8Nd0DIoD5GnJ0d8/EPwqzuhJ++jSfmFcXuA9
	 9oqLDER5lCgbU/z1ocf8isbyDtYoNwBdE+eq1BGp13Xq9XYdvJlsb9+xlxwG6TWCBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
	b=bKFej+k2Rj/SlaQmRrIrrU4K7Jc0/w2vjNBTK+4w4kxojESsWnXj9HehXLWHwe8bMEHn
	 J88Ehk0zaWRQh3ZN1fwCBh4rEd4VCKrFOEuX04qi0uptHfA3kbR6CJ4nj/zAsKVOCGJhl
	 sJfr2d463T9n2aGHySKEqdeLjKA9Gwucl/fNiW2Q8Zm9q4G0NzLo0mOgzSITs7kyh65o2
	 V9hw6zFHGKUeChFr6EfDmBqF5VUChVBUuDMDRn6KV0xrnPicoBWlz2kx77LLEIHD6IEqm
	 B6XMT3k1OXzfy+G/yJ8VRxdMi6uBvBZVVy7bmsZlrHmkc0EfnjgBbg/Y+HAAc1g0qSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F1oZDTma;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D8606A333
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96D8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F1oZDTma
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7334746eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645380; x=1796250180; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
        b=F1oZDTmaQsDGQ51JNM5p0IzgZtax75t2L/qZJgk0TF+THIEM0gaVKVSa6oalhCxTWI
         FtxECx3E1iSfWlf0JSjU9sYN41i6jd4nyY6TEw0jxn5lfDEsplSrGzKkNRorBdF9QtGe
         6q+DQLaZ6j14qrq6BOwXkBi/mzuXqPVsLYL0Dz0AUuNBWZVKBQCeOOoEvrHaMs4zc5rq
         8oSbPtffx9DXx82bXz4Zv6vNM7OrSQIUapV8T0pXh0Xprhr5tAomFfAiECLKEtofCpQa
         xAvjjlJILSQRdLqjN/qVtc9kgLi8PjHtWqVNtdIKZgK8SCedivocmIkovxK5DEFdIU8c
         JpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645380; x=1796250180;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
        b=Niju1tLExhssZh5QdcZ282zJUTnJmSysNVDzyObanF4ArxeJa0D6Fi3ui9J+MctIM3
         UrfVxhYcL+qy/Phjd29xm3sjDzRiHi4sKTHiGi5OAu0lrhC1AQNs0UM5XwmUfyWdKux7
         W61wkzNGf0g9i5ifNNjUIgfeDjC3ljQqET0D1M/Wvj/SzqWNExKtvB2IuO0unYTY5d6/
         1V1eIFmqsY17xlL/OqyvRHRyvs3exenG+Q4atLWh9cFJOOCKW8bh43LbQrtf1/pDWBpK
         RaBlJknzgcki5kTk4qNtTpzT7uqFHY8V/j+1KSo83+OnPu/ig8f/8T/HeaE/yRZaYGsz
         xTRw==
X-Forwarded-Encrypted: i=1; AL+hErHoEqF3OKrnDu2la5PdI+EZJxeVuhMhyBAIRqHhrEtTrve9j0+pSYdjqoxtQM9iuWzx+zNV@lists.linux.dev
X-Gm-Message-State: APuU4Z+jsmFUr0xHaOcKWEnwF1Bd0sis7UKZDPEPuvH94RazsnB5XJkY
	SXwt3O440u/0q88CFCUuBzidl5Z8gC+6SOTit7GuTOC0K7qTsJZXd7O5vxRNQH5MWUpjPVlKqxh
	0lg==
X-Received: from dlgx13-n2.prod.google.com ([2002:a05:701a:cccd:20b0:1b5:26be:e863])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:1b2:490b:6fdd
 with SMTP id a92af1059eb24-1b5568aeb2bmr16509476c88.24.1795645379375; Wed, 25
 Nov 2026 14:22:59 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:12 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222212.1434148-1-elkin@google.com>
Subject: [PATCH] usb: chipidea: udc: clean up bounce buffer and DMA mapping on
 enqueue error
From: Elkin Cruz <elkin@google.com>
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In _hardware_enqueue(), sglist_do_bounce() allocates a bounce buffer and
scatterlist table in hwreq->sgt and swaps hwreq->req.sg and
hwreq->req.num_sgs to point at the bounce table. If
usb_gadget_map_request_by_dev(), prepare_td_for_sg() /
prepare_td_for_non_sg(), or hw_ep_prime() subsequently fails,
_hardware_enqueue() returned without unwinding the bounce table, DMA
mapping, or allocated TD nodes. Because failed requests are never added
to hwep->qh.queue, _hardware_dequeue() and _ep_nuke() never clean them
up, leaking the bounce buffer and leaving hwreq->req.sg corrupted.

When hw_ep_prime() fails, flush the endpoint and restore TD_TERMINATE in
the queue head and any linked predecessor TD before freeing allocated TD
nodes, unmapping the request, and calling sglist_do_debounce(hwreq,
false).

Fixes: edfcc455c85c ("usb: chipidea: udc: create bounce buffer for problem sglist entries if possible")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/usb/chipidea/udc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 98658b65b936..dad7087fc0cf 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -681,6 +681,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
 	struct td_node *firstnode, *lastnode;
+	struct td_node *prevlastnode = NULL;
 	unsigned int bounced_size;
 	struct scatterlist *sg;
 
@@ -705,7 +706,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
 					    &hwreq->req, hwep->dir);
 	if (ret)
-		return ret;
+		goto err_debounce;
 
 	if (hwreq->sgt.sgl) {
 		/* We've mapped a bigger buffer, now recover the actual size */
@@ -719,7 +720,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		ret = prepare_td_for_non_sg(hwep, hwreq);
 
 	if (ret)
-		return ret;
+		goto err_unmap;
 
 	lastnode = list_entry(hwreq->tds.prev,
 		struct td_node, td);
@@ -740,7 +741,6 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		struct ci_hw_req *hwreqprev;
 		int n = hw_ep_bit(hwep->num, hwep->dir);
 		int tmp_stat;
-		struct td_node *prevlastnode;
 		u32 next = firstnode->dma & TD_ADDR_MASK;
 
 		hwreqprev = list_entry(hwep->qh.queue.prev,
@@ -790,8 +790,31 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 	ret = hw_ep_prime(ci, hwep->num, hwep->dir,
 			   hwep->type == USB_ENDPOINT_XFER_CONTROL);
+	if (ret) {
+		hw_ep_flush(ci, hwep->num, hwep->dir);
+		hwep->qh.ptr->td.next = cpu_to_le32(TD_TERMINATE);
+		if (prevlastnode)
+			prevlastnode->ptr->next = cpu_to_le32(TD_TERMINATE);
+		/* Ensure dQH/dTD link termination is visible before freeing TDs */
+		wmb();
+		goto err_unmap;
+	}
 done:
 	return ret;
+
+err_unmap:
+	list_for_each_entry_safe(firstnode, lastnode, &hwreq->tds, td) {
+		dma_pool_free(hwep->td_pool, firstnode->ptr, firstnode->dma);
+		list_del_init(&firstnode->td);
+		firstnode->ptr = NULL;
+		kfree(firstnode);
+	}
+	usb_gadget_unmap_request_by_dev(ci->dev->parent,
+					&hwreq->req, hwep->dir);
+err_debounce:
+	if (hwreq->sgt.sgl)
+		sglist_do_debounce(hwreq, false);
+	return ret;
 }
 
 /**
-- 
2.56.1.839.g22a8290db9-goog

