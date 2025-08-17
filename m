Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49AE7494
	for <llvm@lists.linux.dev>; Sun, 17 Aug 2025 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755444189; cv=none; b=VCR+Y50joLeWSazg3HMf34xWNdO0bjKmfRbTKzeQHEINnfbTkBj7jmLaJDW53cghz23oqf/YlAstqvIkLsqpjq/+9AUheN8zXUhK6yTU5cZ89kFJL3BJiBaD7L80/r7eEQXnyCZFMJYF4V/uS2q9qu9WME/z08fRrrBYiU1RgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755444189; c=relaxed/simple;
	bh=1GiuRAYS2vHjFeheZf8eNKJdhdWv/XXYKwfkhkwg8ww=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mftmtl9WlKTrHUmrdUtny7UJ42ABIrN2/i0it+bhNcY2p6prvplxXVV+CaO7vdnQddQTCUjMARhd3tkvfaccRgwtFaeV4jHgXL9jduBTtVU13Lz+pM/bw09cS48GhUv+KI/9ZiaVbRowfa8mDZtnBCTbW1H9jkaDZ/k6iRVGoQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxhZj3wv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxhZj3wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755444186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SfsxtUaDG4SjEsHhUnvUR3fjAy7MzPOQHtKOcIJMspg=;
	b=RxhZj3wvNIdoPuR67djqB4slOZn9DpESwCQlzXZtcTsTSXBSx6SR2hLeyqL/IlZywuBlkR
	Fap4S7Uz7e34Rl+eOW5/OJ9CGcJClYW0/F+a/YdzThDaEO7/CPEL/p6oaR5CNe70uefMwJ
	yKMe9RHGalXVzMITZfJksH+cUc+c/0k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-G1vGt7a6MESU-0X5dgVUkQ-1; Sun,
 17 Aug 2025 11:23:04 -0400
X-MC-Unique: G1vGt7a6MESU-0X5dgVUkQ-1
X-Mimecast-MFC-AGG-ID: G1vGt7a6MESU-0X5dgVUkQ_1755444183
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E702180047F
	for <llvm@lists.linux.dev>; Sun, 17 Aug 2025 15:23:03 +0000 (UTC)
Received: from [172.20.84.71] (unknown [10.30.45.119])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F14F180047F;
	Sun, 17 Aug 2025 15:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc1,
 upstream-mainline, 8d561baa)
Date: Sun, 17 Aug 2025 15:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <38571.125081711230400175@us-mta-184.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VakQCytmSrri7KUrIzmGN_8hSoUD1Jg57hkBJn63NQs_1755444183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_urgent_for_v6.17_rc2' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1988096302

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1988096302_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1988096302_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1988096302_x86_64_kernel-debug


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

