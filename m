Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEE3A8F7
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360189; cv=none; b=Dy8yvGhx0+KmGL+JB/gvoL1Qa8gjMiQOBFRJd7HD2t8dudvkmBuQe1VqUlxy8usaTfeZzv/LPCItLULUoSgXQye6nCsv4kgXnWoTOEY8J9qMoKMT9mgtcthNF4H+UqPMc9vDZB3W4PC6o0CLVMCtJW295Iozs+Ku7e717QXSGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360189; c=relaxed/simple;
	bh=Q97t0mk263ekUP+2Fasj7dfKd03coRkV7nbDYLy2pw8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CRGeAeiVYOl+FQAyTHs1m7WUSx3UrW7eq/FX1OJF78c2JzCPAUAO1tikX1lXRxQk4rbCXVuGVjqRzTH5vSy28fCSQ2Ygm9RDmmUHTVSzsEEHx1YHyWJ79LO0ae7QoiT4/Lrv1b7gzpSc/k+WV+POFNiMFNQVpMDxjYk4qfcL2QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBBNV2wg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBBNV2wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BNXejKMMiVzsA1rNo6aczNt9cD4Rwb0LeZg5cnnrpRw=;
	b=aBBNV2wgpaGiimrZ/lWQnTenSY1Cx5nky8vAFYutomBgKM7gNy/yEQyZcQWH0OznNFa7nd
	bse9ZnAIwFS7vmlSFEhKdf9dAxlify7TwLC2bw32ULTMKiiKwNh65ynRLE2YPn6+6VwQ5P
	uLkEgzmhCs851Jeb61Yp3BqzyDWY6b0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-Vrp4YjZVOQKs9oFzZXUGDQ-1; Thu,
 26 Sep 2024 10:16:26 -0400
X-MC-Unique: Vrp4YjZVOQKs9oFzZXUGDQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C2FB1936CC2
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:16:25 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 168041944B21;
	Thu, 26 Sep 2024 14:16:25 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc7,
 mainline.kernel.org-clang, 196145c6)
Date: Thu, 26 Sep 2024 14:16:24 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <21286.124092610162601156@us-mta-516.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1451617616

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1451617616-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1451617616-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1451617616-x86_64-kernel-debug


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

