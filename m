Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127708831
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732659189; cv=none; b=IkwEghF6qiYA30blqT5auvXqHPyffmsCKuf4y6yi3Jg3kQyqZsXVyF/9kbThOTpZjAWFdhoHpbativWWoWUh5aquyFWBOzlwuP6jAK7bd9IsCRcJ/kXK/eHBU2WOYZmUqSHqguTIx/4GIAoTFI6caiExclgB5uPRkPZ+NMXWtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732659189; c=relaxed/simple;
	bh=rPrYh18CZ4Dp4PmbCuol/72H6hOLj8EH+7Ju9PpCAps=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=g+Qvq4FENDh7I+SiBNK0quuPyAaaWoKPFR7UKYLzUD5DCSA7+G+Q8idxFbNWsJV74h6Yzr1TEdRpI3223EIEGRoCHd4t1XKDWL7qd0cu75t5lRUGPPc2gDSoGypnRjNz9PPHFXDXrkLAQVN2dxMc0w7SlWuLRD5/3rD3SHxHivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5Hs3brg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5Hs3brg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732659187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eNjGaQLYBNjjkNNY7GkKmU/cKa+zsxWVoBpHp6U+Ggo=;
	b=N5Hs3brg2pvhV4KyTGYVToIOo1fcxcpuPvZRS8L8udpel2PcSWMryoppUMxvCzN23ljEXJ
	pR9LvOdnz0jzs4cwevGCF6m/5XI9UUETEaarKdx7MInCOn41dZRY7qQ2IFki7rNNg+uZES
	vylxi5Un05wQ8X45YwJu1VHHaSvdqXA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-qbhvSPfGOi-w7923x2vQyw-1; Tue,
 26 Nov 2024 17:13:05 -0500
X-MC-Unique: qbhvSPfGOi-w7923x2vQyw-1
X-Mimecast-MFC-AGG-ID: qbhvSPfGOi-w7923x2vQyw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAFF61955EE8
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 22:13:04 +0000 (UTC)
Received: from [172.64.13.40] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49B5A195E486;
	Tue, 26 Nov 2024 22:13:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 445d9f05)
Date: Tue, 26 Nov 2024 22:13:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <32654.124112617130502807@us-mta-163.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QG7uqihEfkI3u4VGfqIFbc-WyVb3Q2Heq5vyb3RdIRU_1732659185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.13' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1561650016

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1561650016-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1561650016-x86_64-kernel-debug


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

