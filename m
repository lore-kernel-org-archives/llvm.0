Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02CB30DEDD
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231131; cv=none; b=rbJTc2Xvu9w8HtZIjyoR6Kc5wyHyD+BbFFJSLwHvD3XhaAFI/pN5WO6fTF7xKcZIHQyKtD40EC3sib5ewSanSSqeKLljRSBybCftXoqQeOh4SftLSbJLXP77uJ4XRbsb59tY9WdRCxeBa4bmJrvwRuv/UdIJgkoky2e9t/z9Gf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231131; c=relaxed/simple;
	bh=l2udi8EMOw56zKog8kJCLjWFU3GuLVcrXZ/uB75OIBY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OeO2Dope8CanheEmBb+aoSubVmqn6YaRv54APLNf1n7U25J6nRIFjtgtmafH/xI2VDCoJ4ryMEFhxzDQZ8lDc9nk2b6opbA0UAnLHXQlN9J6kYub8YyhEUAsC6qDdcRhvLVhI4FKlN2pIfVu3T1EePelIcru2MKgg/TWqkfcJYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ssg+UK/m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ssg+UK/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782231129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yn7WxGdVcLFnLetJwm4SZ9zdCKmPqv7JoSImC1krIa0=;
	b=Ssg+UK/mD956dW67Y65JTrl9HDECdntBFGFOmylVLYwrtspmuyQN4cCeSvGkdjmeRRfRgL
	sroCfSJbFnkEGyM1TaysA8pyfWqQISvfbtaWp9RJLH/Kute50dBYjcPjKkuALDCfA0RXts
	OJ93fRqyuQ1xDYFWAL3dWiX+jHlkges=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-hlaME7w-OWCL7t-7uU1AzQ-1; Tue,
 23 Jun 2026 12:12:07 -0400
X-MC-Unique: hlaME7w-OWCL7t-7uU1AzQ-1
X-Mimecast-MFC-AGG-ID: hlaME7w-OWCL7t-7uU1AzQ_1782231126
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71C1418005A2
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 16:12:06 +0000 (UTC)
Received: from [172.20.153.190] (unknown [10.30.45.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CD0019560A2;
	Tue, 23 Jun 2026 16:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 88): Test report for master
 (7.1.0-0, upstream-mainline, 502d801f)
Date: Tue, 23 Jun 2026 16:12:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev, mmalik@redhat.com,
 omosnace@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <25757.126062312120701587@us-mta-689.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HS3nInlgLYQmqdxLj_zZDFDuTFTWhrL5_N-nistHA-0_1782231126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'erofs-for-7.2-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/xiang/erofs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2621615325

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2621615325_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2621615325_aarch64_kernel_kcidb_tool_21506075_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2621615325_x86_64_kernel_kcidb_tool_21506080_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2621615325_s390x_kernel_kcidb_tool_21506078_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2621615325_aarch64_kernel_kcidb_tool_21506076_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2621615325_x86_64_kernel_kcidb_tool_21506081_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301


Tests that were not ran because of internal issues:
    /distribution/command [s390x]
    Reboot test [s390x]


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

