Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B02563
	for <llvm@lists.linux.dev>; Sun, 12 Jan 2025 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736717589; cv=none; b=p2Kpkm7Zt+ULEkk1a6dVzcUGTd/9CNaDM5tA5atpHUBmSN4ZQaIsjAChzccnJqFhyqP7cO9H+++hF5YFh+2G2ElH5mZbEwryKheb8cfw9R1I9Hq8Utzdk7vNL1Hp2y6r+XXp2Do15lY6VLJjc8LGgztZrlbeHAak5H2hj2gopQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736717589; c=relaxed/simple;
	bh=X8F9Sd4A+B5y/kzEAFtwjv/6Hk5JiwKN1C5OTh5/EFU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=M+22abXd/G/oCxVBm7u2SvyfD5uk7S86VPIBTjFyrdSftqitucDAHX6bt1BftH2G7CQT1KKlQzMS6VURtXUT2YSpf/kSsdZFOfRUZRKmOy+t2Zq2A0ihv+7cIQyO8Rqgmd0Hu9kgZAKUvvEV80+cy2r33IDrZ3ELuZdZji0oXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JTEWlPM7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JTEWlPM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736717585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sNXok+KeM1Qnl48qnqtaosuLu/sXQhBwyIbrc+gBWwg=;
	b=JTEWlPM7etCcbVcK4aKeWtu58FOh/zFhY62DRxXtG8Dp9jZz5kYHKCzWZLJQmG7E3e+xzg
	qmmLhiKT9IDz9oWMSUvqBDuxSsYfL1JXV+/xPRxmE68cnr0RKrgqalqiv8L0oQDYudw9Nv
	2J8l7m4pXTBG8IHY01ackmQrj1S4a/I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-dbILcCJjOue4neL5NqPFYA-1; Sun,
 12 Jan 2025 16:33:03 -0500
X-MC-Unique: dbILcCJjOue4neL5NqPFYA-1
X-Mimecast-MFC-AGG-ID: dbILcCJjOue4neL5NqPFYA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00C7C19560B0
	for <llvm@lists.linux.dev>; Sun, 12 Jan 2025 21:33:02 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61BF619560A3;
	Sun, 12 Jan 2025 21:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, be548645)
Date: Sun, 12 Jan 2025 21:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <20964.125011216330300173@us-mta-427.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UUzqoMwudXidSueLKU0btyLsK2-UNDGP9aYdU6hzoP0_1736717582
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1621703485

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1621703485-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1621703485-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1621703485-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

