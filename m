Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6022243959
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739049132; cv=none; b=qsTKYA/gGXPsQ54fmmMqtOpFu5b126vSO9HZ3QHpRwyfOVcpaWNcCvBA0zSLs79A2a/+/+ddhdvZ5MIlDCOQsQ2CwFjgh4ybb/5OP2XeKzHh1U8KZnrw8WpJYCxUMlR7iAilLBy0ew6nBk3S0eyEIwW1IPbQi7sz870dFdI9t2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739049132; c=relaxed/simple;
	bh=PUc9zev3z68r8bv/Q1wCsccpfwxz9QIIJ0foq7UBscs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=nQRqaoZSlg3s+zH4NQA4yGK10fFp164/3IS9akifGjOaFW+U4VDMN8SKZdWdMG6spg+4C8DYaPUm/9nrlMH5pxMhpQlz26VrTh4K8lP1yT8nwF+Tu1qyROGEKpcIzuA4VNhGSm5ST8nIa6sJjH0wzn01Ot734BGhJxokEAJgmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZtZNO5oi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZtZNO5oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739049128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7OKe4rCWQ2uSgJHrlUvy6EoYX0sFci7R3HS126Q9Q3o=;
	b=ZtZNO5oi+MTF+Gi/JBkNnNxHJUBYaL5NDG94mFbWNNuQv9GKjVhR5/2d0+YJHzAcx3YAIV
	GWIST9uMPKuhCohpEExwdhaD0SADnPpNM+OKmn2b3QaDCa0Ce5NT0kMVIDuFt+ecMTHT4E
	SwPLH6QOa3+wkzFuy6bGaZUIkYeZnwk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-vN5oM264MXKCJDQbAjD_SQ-1; Sat,
 08 Feb 2025 16:12:07 -0500
X-MC-Unique: vN5oM264MXKCJDQbAjD_SQ-1
X-Mimecast-MFC-AGG-ID: vN5oM264MXKCJDQbAjD_SQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7D611800875
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 21:12:05 +0000 (UTC)
Received: from [172.64.12.31] (unknown [10.30.33.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59CEB1800360;
	Sat,  8 Feb 2025 21:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc1,
 upstream-mainline, a5057ded)
Date: Sat, 08 Feb 2025 21:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <86113.125020816120700103@us-mta-178.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3yzI0up8makBM6PdbliPl2h_3LSjdRoyBk_sEmXwkLU_1739049126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86-urgent-2025-02-08' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1662202031

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1662202031-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1662202031-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1662202031-x86_64-kernel
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

