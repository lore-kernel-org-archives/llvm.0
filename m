Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F05B17555
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620337; cv=none; b=p3Ovh2ahf60GiL6k6fCS3xd99zY7iAHKsj8VvTPxQEfEINVUN2hMJ/1Lgx85lOrnIcx/QIwxUBE8KDgQw+ZerqJ7ySQsZ+U2SzRcuMimtNNxFsLIf6inJbeR4hVILfrbJBKskVNC/odB/NKuQBPan9Org6d7pYEj0b8XNT8Gpng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620337; c=relaxed/simple;
	bh=UI4jpNhWRLdEK8OlV3MIs6HAet9sfdfihxh6PwC1gs4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ex4gPN0RAeQRaKqMZiv4BLWCvxmikOmZtafT1DIMZvzg6nyRPgWfL4UPDkxu4cyxPviLAUQk2A09HmA+KqFU0CkuHqU7pHCf3rTsPryvn/0ms+2B4q4czJ7ryvYzB/4V+SSKTmUafXYvSQZUx/YDFNb/2Ge5glaWq874mQUIdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSGxSZ8h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSGxSZ8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748620333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jaIJsyi81qTtwrRunOh03spW4koCPetyBAzOWLLfJw4=;
	b=MSGxSZ8hCjoyvEC5Bd7bdNcRESbLJgHjq0O0LVvE2AED9iszE4ngf4oEbZW2VFISLPQt2X
	c8aISCver1Csofe+WQD0jdHspSN0SdhwV2ZNBOJAswtcKJacQdrsq3dBSMG6ObqnOnhPlM
	cLb6UVDl+ZTywgy61Dyi0/YVkkMamok=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-m4qeTAdsOSuuhGEP-FzyOg-1; Fri,
 30 May 2025 11:52:10 -0400
X-MC-Unique: m4qeTAdsOSuuhGEP-FzyOg-1
X-Mimecast-MFC-AGG-ID: m4qeTAdsOSuuhGEP-FzyOg_1748620330
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8FA01800570
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 15:52:09 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A7DEA18003FD;
	Fri, 30 May 2025 15:52:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 100): Test report for master
 (6.15.0, upstream-mainline, e0797d3b)
Date: Fri, 30 May 2025 15:52:08 -0000
To: fmaurer@redhat.com, llvm@lists.linux.dev, liwan@redhat.com,
 omosnace@redhat.com, ftjahjad@redhat.com, mmalik@redhat.com,
 bgoncalv@redhat.com, haliu@redhat.com, jbastian@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <59165.125053011521002751@us-mta-262.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w4Ps9anzWnf6cyoK8il2bnPPlPv8_61oa50K8o38KeA_1748620330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'fs_for_v6.16-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/jack/linux-fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1843426652

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843426652-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843426652-x86_64-kernel-debug_selftest_bpf
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843426652-x86_64-kernel-debug_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843426652-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
        stress: stress-ng - memory
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843426652-x86_64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL memory: --stack 36 --timeout 5 --log-=
file stack.log
                       =E2=9D=8C FAIL Test


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

