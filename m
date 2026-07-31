Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22135330307
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534791; cv=none; b=V9mvF0CrfxVK+lEoMq21YJzURZeavhZi32m+DANM3RirMNb+7CR4fTnDdE+/nnOc75oQOvmBNPXT+xreyTEIFftVsT6O3vY2myWiADtcXWyeAvIIpbPGUnXNAq9UEhnowjL0oik/AJzhBJ4pCKOAR8Wizwk8+6KRarvVOUUwVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534791; c=relaxed/simple;
	bh=w8/HOGLQJaIFXHECdbuvV3wDgmy8WBZkOPEiW5ZzHdM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=usMSd5EVMJO9VFXi9GjXGiw5izZKNXNh8muXzSAayInLSIbrAp8R/lecqdXZoIcHVhYRZJB2/CZdb7us7SWKa6udphKvaLzRLjZz7MylQ0lJ48/qDXiqMXkg9gflBNOeZ6Pe8LbpH/Lg7tXOTQC4HuCi2L2pQU4XrBzvdc8lXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B09Kp/UW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B09Kp/UW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785534789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6s76YqHMs5oPxH0bZSyPczvXL/G+B3gMMyLZsZJmJb0=;
	b=B09Kp/UW9KZJe4IiSfDJyNZUb07cZmvTrJmpkTF7+6F4RNGmG0RhoGivha95+JJ2tB77HV
	eNy+l9+eXTZDWpT+QbajD4IjuRo9OrUs4ebMsSnIgmheFRvKdVEy25BZSO2e3lgO63GTCz
	wwF9t8K6tqDEz5wyW7uCMuvOIOMyVdU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-YsgYHkPCNd-wMAh4Acy6kQ-1; Fri,
 31 Jul 2026 17:53:07 -0400
X-MC-Unique: YsgYHkPCNd-wMAh4Acy6kQ-1
X-Mimecast-MFC-AGG-ID: YsgYHkPCNd-wMAh4Acy6kQ_1785534786
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B8AD195608E
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 21:53:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 159E630002EA;
	Fri, 31 Jul 2026 21:53:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc5,
 upstream-mainline, 596254ec)
Date: Fri, 31 Jul 2026 21:53:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <21509.126073117530701168@us-mta-659.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D_rgVIwiruPQlyg4lYiBUy89BTXtShNEM79P8hMuGVI_1785534786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v7.2-fixes-1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2722696870

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2722696870_aarch64_kernel_kcidb_tool_21770827_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

