Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88782E62B3
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784519591; cv=none; b=nED6lc5s95uWtaztW2Z/tspArsEKnNLmDtIGZQtEijEDEfVww8ArTgDhc7fK3bFgDg39EKMKqUV6riXZi8eSY0oz7QfnGE8YUHjg1JZZwC2CSuZZ7+L79TjswNcrFti6PeAb3XJJ7UU7gpNwTb6H59jtMxhQ9tN4Lr61Uic4D24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784519591; c=relaxed/simple;
	bh=2YmJUsJK6qB9FY2H2S2t1DJoEIC4R6B8UJYOjaiLBn0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dssFAyRDFxOQyfEA39ZSIrpFbpCGVIG0oBX/E0V9sYBDMRF9dvgAITlzHiAFc6bTznLCWL5By9MONLoomIRxAm2Wz6uvfzP/dhg2UZa7zG0X4RXrI7kJfCcpBmKxJY3XXmQqn8B2vRFeaIcOc2Y9QkFCAyPdJ1xKFZDlrAao5SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qyn0Dd6p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qyn0Dd6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784519588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J8nWyIlBYLfS3dKxk/e/ti2E0jLLYGYTEEKO4up4JxA=;
	b=Qyn0Dd6pMwtlhmjbfTvRZZXYveMtlSGXM24AyK8pYF1Au2DJrd1WtDr4Yu2WXRfk4NlUzI
	AxtfcTjukmQqgMqrhFu87w3hjwmAj6q0q75mVsf65DtU28jn3j3zp13YnfG8EtoFMBHWSC
	4AZL6JOrign0YY/zClvVpAqueOJGepY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-267-gLqYB5yzNOKiJaAau8w5Rg-1; Sun,
 19 Jul 2026 23:53:07 -0400
X-MC-Unique: gLqYB5yzNOKiJaAau8w5Rg-1
X-Mimecast-MFC-AGG-ID: gLqYB5yzNOKiJaAau8w5Rg_1784519586
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 246B21800BDF
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 03:53:06 +0000 (UTC)
Received: from [172.20.159.80] (unknown [10.30.44.85])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DB8618001DC;
	Mon, 20 Jul 2026 03:53:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc3,
 upstream-mainline, 980ab36a)
Date: Mon, 20 Jul 2026 03:53:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <06655.126071923530700281@us-mta-267.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NlnUuk2TJE_X9FDEOyLrjcrrIcl4MEfbG9ugpZKrkWA_1784519586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'block-7.2-20260717' of git://git.kernel.org/=
pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2688736192

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2688736192_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2688736192_aarch64_kernel_kcidb_tool_21675316_9
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

