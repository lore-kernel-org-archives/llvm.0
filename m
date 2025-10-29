Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9330506D
	for <llvm@lists.linux.dev>; Wed, 29 Oct 2025 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761718939; cv=none; b=O7tJhcVkD4u5Ero+NabYCN0cJYye9p9Hd1n5q+5qeueTXx1zTHVj5bvCIAvxA9TCzMFJB6elYvOFFgX1MeXGXp+Ek7gszy8XuuUcRvQxacplgta0c88p1QOcwzMFcQ8ODwfA8gqhpRSjK1V77dR4BeOtW12O4zml7LOu4+d2M4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761718939; c=relaxed/simple;
	bh=FQkf6m8JPKLW+4oT2uX8WiAI2YSEoU2T24L6nlSD2+E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ho9xK4DGq5FLfA3WQ2aRQI9wwFjxj/5ScMaekJDQn/czhdYNKiE6gYRbHcw31QuDFOXzK8oOGT/CfA0MsOWF/PvYNO0f+Ru3Y3/tJBCtR9ZDBU9/2lnKM0DfPkXl7sZqUD4cIFyw9z+1XjTRXacdcK3uq+QYxdUb/+v/0M/oo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BgJN6/IL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BgJN6/IL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761718936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lbXjbPNsRUkvzfc4GZ4wozL2rjDJvTxVGKbH755fbFA=;
	b=BgJN6/ILLteq9WU8Kex+3JA5YH0jhPiRs2LTvZyDlmD/iwmY+zRAdFuMswxcI/cgtt4d3Z
	MTOm7iN7X9dEbQzxcyELIesfV5BI2poljWeHxsrjWHbdgsur6KAwSncl5HQzmlA1yUastV
	uPkJxl8QOVEo2JIo3O0XF5489rhHiNg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-Zu5kZD1LOjyb3711emsXew-1; Wed,
 29 Oct 2025 02:22:12 -0400
X-MC-Unique: Zu5kZD1LOjyb3711emsXew-1
X-Mimecast-MFC-AGG-ID: Zu5kZD1LOjyb3711emsXew_1761718931
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F420D196E0B1
	for <llvm@lists.linux.dev>; Wed, 29 Oct 2025 06:22:10 +0000 (UTC)
Received: from [172.20.119.238] (unknown [10.30.45.48])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50E111955F1B;
	Wed, 29 Oct 2025 06:22:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0-rc3,
 upstream-mainline, 8eefed8f)
Date: Wed, 29 Oct 2025 06:22:09 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com, ftjahjad@redhat.com,
 yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <86083.125102902221200297@us-mta-407.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aGXYGlmbvpx7NrvbTc5I4lA6JHoZkUed4k_fl6B8Gck_1761718931
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.18-2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2126345853

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         aarch64 - xfstests - ext4
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_7
         aarch64 - xfstests - xfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_8
         aarch64 - xfstests - btrfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_aarch64_kernel_kcidb_tool_19873855_9
          x86_64 - xfstests - ext4
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_7
          x86_64 - xfstests - xfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_8
          x86_64 - xfstests - btrfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_9
          x86_64 - xfstests - nfsv4.2
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_10
          x86_64 - xfstests - cifsv3.11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel_kcidb_tool_19873870_11
          x86_64 - xfstests - ext4
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_7
          x86_64 - xfstests - xfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_8
          x86_64 - xfstests - btrfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_9
          x86_64 - xfstests - nfsv4.2
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_10
          x86_64 - xfstests - cifsv3.11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_11

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2126345853_x86_64_kernel-debug_kcidb_tool_19874002_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
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

