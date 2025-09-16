Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A14723BCFD
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050050; cv=none; b=BhWD3wbOBHasAAp9Qn/p2+jvm2xITh+0ACAgk+0s62y/LlGKE3neorPn4ZmdE7d9Nh8vv4kEp64srW9wkJFxc9u3jOT1Kofv76z7DAqXkxMZ+dEcc+izUPULAoyE3wvu/XqXKAgHkN92WkTVgfI7p4v56lG/WlXuvzVViRo3nlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050050; c=relaxed/simple;
	bh=jAVw8Z6SCj4yOTClXmcUrKH0l+iaoBOSX+ju6/Ot4wI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CKzISctcD+Hy5hMR5mTH74Og8QjifBgSjeMb68bkrOsC/oPH07PD0b2oHUcpFtGqM3VxKYoT9YrdHvhErcG2FdngBtHoV/LmXhXc+rbZhUl9W6QBUfkP5mpBolv0w8zBduPRDcotqARIQHzc9Lg33o0Kn9kw8nwqPD8EkidtusY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQPTQmoc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQPTQmoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JxDwN81NBMtSoz0tyVOYEqpQcE/L+lKd0EsRuiYYUJs=;
	b=MQPTQmocm8n8IuSVznZ+KDwm2TCMmpN4vZ/pDikd9yWTQf7l3pOKpiLlAWbNivMiGgUImK
	tMNuUIfR8Yi1o3sEsrtSWB5J3hc7h/nSR769ycdvYpU+ulZTb35CHATZOhmCE9DpGpOXc2
	dG11PXMNfh9PTqwGMhMW90HvQ9yaIKo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-DgjRes84N8ysdDKj760FEQ-1; Tue,
 16 Sep 2025 15:14:06 -0400
X-MC-Unique: DgjRes84N8ysdDKj760FEQ-1
X-Mimecast-MFC-AGG-ID: DgjRes84N8ysdDKj760FEQ_1758050046
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E202F195605E
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:14:05 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B8F8C180035E;
	Tue, 16 Sep 2025 19:14:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 23 of 137): Test report for master
 (6.17.0-rc1, upstream-mainline, ee94b00c)
Date: Tue, 16 Sep 2025 19:14:04 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <85849.125091615140601820@us-mta-640.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uNiZH77Z6kQ0i0JFfvpLxkIdMHz93QKtgvWufx4vHK4_1758050046
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.17-20250815' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1986398983

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1986398983_x86_64_kernel-debug_kcidb_tool_19373143_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1986398983_x86_64_kernel-debug_kcidb_tool_19373143_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1986398983_x86_64_kernel_kcidb_tool_19373136_21
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
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]
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

