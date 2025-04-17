Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F541C63
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922531; cv=none; b=Ly8nk0g5p6gm/VnqOiWuoONoPL7BDUktoJp9H7dInTavXdDncU5goMbOkV5iz26nb+NsuvmnVtId5MsycD+fj8f+0njxkprEu49C/M+2VSpIdPbQ60Ml7HOnYuGbyvMa4Iaba7iiVAet1fZvRXtB94dF24quT4LcnT+VW+NjhPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922531; c=relaxed/simple;
	bh=tFPAcQGN1X7jDVB35ve1VuSG20jDsTidJbjX7TSe2Ww=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aTyFNkB8GA1oH4VY53EaCPNeg4r1GCFE2UwuiE1XKGPuOc1B7B1fvP7pzGXO1z9i1ewgXRgq5GMkboEm1n4CEz1C7nIWec9BsfBzGG5arGrBn4RvEo8WXV//DSwrfAIRlzX0dDgOPvaBLA0t75OU2ZgZ8QIhl/lnuDQkKdsVOMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AaXfEawT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AaXfEawT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744922528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oVA9hx1BRf+v4x0Q3Q+kTDpH031jh6UJbFj42JgaVYI=;
	b=AaXfEawTtVnOzFozGZQyGIsecj1biRkEvkv1OgfdkpKRF9PxQpm/YoUqp5482Pp3bCPTk2
	xmXf3Cmom+Z8cB6/CzgdLgQUBdFDcKYQQFPDa+Slf1jHj2h4kL5vKhj1FvxDKBI4XRcMn2
	irgzpaihe5td4RZv0ylHjSUYbYRF7kI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-uxi7zMhuOsi8AQaZS__mAQ-1; Thu,
 17 Apr 2025 16:42:07 -0400
X-MC-Unique: uxi7zMhuOsi8AQaZS__mAQ-1
X-Mimecast-MFC-AGG-ID: uxi7zMhuOsi8AQaZS__mAQ_1744922526
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AB8C1800983
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 20:42:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E395E18001EA;
	Thu, 17 Apr 2025 20:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc2,
 upstream-mainline, b5c6891b)
Date: Thu, 17 Apr 2025 20:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <27777.125041716420700127@us-mta-674.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ltW5ThbHeVr4J_rlIZsGQ78ycfHrsneTBz86JFxtHBs_1744922526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.15-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1774395453

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1774395453-x86_64-kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

