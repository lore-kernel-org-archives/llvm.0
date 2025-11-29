Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC63836D50E
	for <llvm@lists.linux.dev>; Sat, 29 Nov 2025 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764441197; cv=none; b=DEx+35/WASE408tn10kk1nLYNU8+bAG/gO+ebwFIgnSBFQd1mDYExAKn29vIWs4AHys7hcw+uCSen9HcGes7K48DDJSGKm9iq8Xg5gEZjWKnq9UDSrCLaRs0NZXqu+VqMh1+deNhgv6TjePdoewtYnKkj7yQO9A+KyVTzbycqXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764441197; c=relaxed/simple;
	bh=jllXpLkAPsfMI8AQe8cQK8R29MIV76wMcRuRa0qvCX8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=P5WAdiUXj5kH3c4skiwLXYBMHiiBvhrzKlhriveQQOdcCB4DUsfp0s5W4BpFywfP1NePV1eXjMYdQTogKgpKY1/ICX6YAnfd04EGTJCS6KiR4V6QYivtqIKVwyeHlvoDJCPErKB/vrxDfkCVkKdHrd9WDq29IvH7xgfMbAxs4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuSJUYwE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuSJUYwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764441194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mmRewe3jScXeHBmu9ykSMGnN64hkFKcHAfP0EY+94JM=;
	b=TuSJUYwELcxG5rIHJkDNUKrXboFDshoUZyBhDDUvP9tHy6DDjTyi6F5rSRLfz3ViWQgPHx
	at5HfjbsmRRWJN+dirLxPC8ZU41YNvjIpAlAfYCbrRrXAPzqFdoppjE2nPDZ2GiKnIHw4b
	/NQ3j5v2eoLRR9zawNQKBm4w1qXZxkY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-134-wQHB3tGaNUeLlctmBuSjhw-1; Sat,
 29 Nov 2025 13:33:13 -0500
X-MC-Unique: wQHB3tGaNUeLlctmBuSjhw-1
X-Mimecast-MFC-AGG-ID: wQHB3tGaNUeLlctmBuSjhw_1764441192
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A0F0195608E
	for <llvm@lists.linux.dev>; Sat, 29 Nov 2025 18:33:12 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5AC8F1800451;
	Sat, 29 Nov 2025 18:33:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 137): Test report for master
 (6.18.0-rc7, upstream-mainline, 9917bf8e)
Date: Sat, 29 Nov 2025 18:33:11 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <73489.125112913331300101@us-mta-134.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iwV0ceJmIeCRp4Y0jY6O6ifnOpfJrHn6nmxXdbLwB_s_1764441192
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'io_uring-6.18-20251128' of git://git.kernel.=
org/pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2185844786

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2185844786_x86_64_kernel_kcidb_tool_20120550_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2185844786_x86_64_kernel-debug_kcidb_tool_20123931_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [RHEL10.0] blktests throtl failed
            URL: https://issues.redhat.com/browse/RHEL-66783
            Affected tests:
                Storage - blktests - throtl [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]


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

