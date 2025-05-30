Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3041FBE80
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619792; cv=none; b=uemorCC3YhATgCXRQPJ3FtK4AqETAj7WiH7ckFBaEs5S8g5f0dfpPRR8bMk8jD2kg4x2O7tTkt6+dY/ILIdleH7UjHZ3Q/Vu5Om5dHeO7UYIV+8ItLmnSY+qZ+nUS6Y2AKeet2yh81ySmRSCpLs1qO9phDRcygV27dGeDZA+cqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619792; c=relaxed/simple;
	bh=0JHgklpRhtuIwAd54gC9dD/ZEHgdU2UMGhoKMJcXscI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=l/gGbK5yQV2tdFLV+H8DdLZAFtrCmt1qVKkBlL3bBC/KnefhYy/DiMW5m50pwA0OEbYtg0KUPdTNeSssOOG2PAMTwheo3MGiQvN4rktAUCy0Ye1sQb4iS+BE+4gZMR7MyL6YucArnley2WTL4g9tLb5bBHDCxNhlLi+QgBjimmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVsYbpQl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVsYbpQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748619788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pCfAKOrCS6JJY1hCe4WDcD1OH8I4lkOSr9KWCUGBEtY=;
	b=AVsYbpQlzD3yOpLaOHPMsAZuNlMJ4uDudrAHTHeJR7Wu+Tz6W0el7pnOdzkX61Jxk4Vi9i
	dYJqpvdMZM8AvRdgmi6jMqRx+8DdMUUfbmgBVy7REfY3immalNO7QQ3MxqnXuWcxhVa4xS
	/U8ZpHOGaDamuE3MqnOTlto9ePl4QAs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-VbI-UuIvM8yGybb7VzLdVw-1; Fri,
 30 May 2025 11:43:07 -0400
X-MC-Unique: VbI-UuIvM8yGybb7VzLdVw-1
X-Mimecast-MFC-AGG-ID: VbI-UuIvM8yGybb7VzLdVw_1748619786
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D091B1956094
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 15:43:06 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F0F430001B7;
	Fri, 30 May 2025 15:43:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 100): Test report for master
 (6.15.0, upstream-mainline, 9d230d50)
Date: Fri, 30 May 2025 15:43:05 -0000
To: fmaurer@redhat.com, omosnace@redhat.com, ftjahjad@redhat.com,
 mmalik@redhat.com, bgoncalv@redhat.com, haliu@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <02491.125053011430700950@us-mta-452.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R44MPb0CIINZeEwU6-oFBmkMH2b8h_Hk9kkXt6FXAOs_1748619786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'driver-core-6.16-rc1' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/driver-core/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1843339406

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843339406-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843339406-x86_64-kernel-debug_selftest_bpf
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843339406-x86_64-kernel-debug_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1843339406-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
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

