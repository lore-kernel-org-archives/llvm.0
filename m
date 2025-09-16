Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0B2DF6E6
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050386; cv=none; b=QKeBJsnC9IM/spiRTHg5ZSFmOqXi3qA99Jexdvq6BrPSGoP7BE8VLP+UzKUF+CEDH/H+RyInP8aCBwv3Fb0f87KpHHEP8SUkgHptfcRW7SA0libQirFt0fC9H5f1U0477piZAy/+LCvrANAGFShSo8ay9i/EfWNqBnHHNfNlraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050386; c=relaxed/simple;
	bh=SHgbPpD94j6w2Fxo7LBeiloL2wYpu2jb1pbbO1xvVwE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=f/TKMCE5xFMdAyawlv5TFNBlczSt7nqcuvzAD+nsIgXosYM1mZ4v4iInN71BP3WuSlYdaFQ2MWvNlNdBVQ7Kk1wTAHF0rtvjMvZPq2iCG7MNXQlzm3OwN5ekSXDU5Rk9tn7Qm1Px4c3cz+bNPP+G0rcInC/i9GbcN9lcgijXNaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IS1HCjhr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IS1HCjhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wpJo8HS5ybZ7ne83kzZV0Zx5e1hCdb3tpYDfH6ngnFA=;
	b=IS1HCjhr5DYseaa20LVkoIdaLbE3onPiqNTeJb6agE4H8MdhC+Viuoe8A1shB1skGmfeWu
	DpFmrKvNygUDTba+txyyGROatx/+9YCwbJl04/s5gZ8ydVh0RwM6ejsbivfCilFOZU9iJG
	WsF1K7cwRWaTZ6oz5bxouHRIao0GsIE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614--PulmbB4NmGzL6GQ88Hjng-1; Tue,
 16 Sep 2025 15:19:42 -0400
X-MC-Unique: -PulmbB4NmGzL6GQ88Hjng-1
X-Mimecast-MFC-AGG-ID: -PulmbB4NmGzL6GQ88Hjng_1758050381
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DE541955F0D
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:41 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D4391955F1C;
	Tue, 16 Sep 2025 19:19:40 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 20 of 137): Test report for master
 (6.16.0-0, upstream-mainline, a6923c06)
Date: Tue, 16 Sep 2025 19:19:40 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <89209.125091615194201111@us-mta-614.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RSmyaXT3am9TGS6nvi7ni5Lk2td0xyL6O7BsolbSWxw_1758050381
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1962196282

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962196282_x86_64_kernel-debug_kcidb_tool_19273946_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962196282_x86_64_kernel-debug_kcidb_tool_19273946_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962196282_x86_64_kernel_kcidb_tool_19274134_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    selinux-policy: serge-testsuite [x86_64]
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

