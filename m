Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C731E8A1
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050790; cv=none; b=CCu5OcJyPB0/3EqP0p8TmkSYoq9uylRXIi0OoeKuyyZUaWfP7q7fOmyTVt5JZB/S4vhpXxv+AGrYkfvzmPXllYO6IeSmqhMGGkW01mqdObZMt2at6Z/fpP6zmWoqg6u+Ow48nP+5T3IER3OlZheyrSmkGznrFBCjepwHq18nlgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050790; c=relaxed/simple;
	bh=/o6DLeFftAti8xCZ4bB2FK9pmaqRKHiFGHYBJOnaCmo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=he3dXo7YRvArMBp8WfoagYUlvg40IURJGiRZzojTWL+PQl9ZlQSIQ+CZwKGLSgQfYDX4wwXwP4gXc2c4SvHmaq0sRs/a15UehXri/TqVJ/Dhv92eGv4VhzlYavcbkhqRmEn+ue62neFdBj4NCoLHkl6GVct9aY+9NXK0RDrflS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJPIdPM6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJPIdPM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XPFBAJtVVPOyHFKjn9ei+fbJVdnYGOLQI7bDrdBF2rM=;
	b=iJPIdPM6tKCkPgkS5Cr1tk6PToYT48unbRgE40X4Yu9YfSQ84jNeRpoywh/ubhLr2XLwxg
	D9io0C0P0AILPYbrS9lAHza2cL1BRevqTWK+5hxne611nny1t+JAnpiqytI8KW9R3MBpWN
	nqg6yw07KXaxfNB4yDbubtRybJf3/2U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-lFgH11IqNVCQz4OOoVo_yw-1; Tue,
 16 Sep 2025 15:26:26 -0400
X-MC-Unique: lFgH11IqNVCQz4OOoVo_yw-1
X-Mimecast-MFC-AGG-ID: lFgH11IqNVCQz4OOoVo_yw_1758050785
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 950B7195608B
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:26:25 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6D4F300018D;
	Tue, 16 Sep 2025 19:26:24 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 2b38afce)
Date: Tue, 16 Sep 2025 19:26:24 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <38921.125091615262602255@us-mta-632.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a-Adr3iQbiZrlZmCU6e7Ct9umpyfxKNBHbHE1WQfcKk_1758050785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'turbostat-2025.09.09' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/lenb/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1976276073

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1976276073_x86_64_kernel-debug_kcidb_tool_19332373_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1976276073_x86_64_kernel-debug_kcidb_tool_19332373_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1976276073_x86_64_kernel_kcidb_tool_19332366_42
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1976276073_x86_64_kernel-debug_kcidb_tool_19332374_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x]
    /distribution/command [s390x]
    /test/misc/machineinfo [s390x]
    Boot test [s390x]
    CKI/restraint [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

