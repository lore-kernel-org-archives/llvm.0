Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E598370AC3
	for <llvm@lists.linux.dev>; Thu, 21 May 2026 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779343933; cv=none; b=OWEBeurTzdgStV0n8XM1zmOB0Hg+jgBjkeD1bi5y9+Cby7QKhX5hL0eup8YPlJ6LyQ6dLBubg0jg4zSn+ph9TK9ra1X7XSBRlKYl6GYxQWwlldgVV0x/3/NmIO+Q8yqcOfIkliASP7zA1rBXCSlACxnWbdYQYBwXbvNSPwVYBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779343933; c=relaxed/simple;
	bh=qxewFkKqbpLol/TP/ODgvF8bGk0QbpcSHbdreqE/PxQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=E0ulQ57xhgkTzchQ1gB+NUIUWrhJIGDXjEbc62wjvxeOKS3Vz7WY5tChkcZ/P4272zOetwWqhdMLvIC79rutdFUDLmjUnGAUbX9E0WeI4mLGm2fFQc9/dZFEixSqWuNskV1r0SCPcQq6TYCmvfqtou5PBV8jnGjupnB9MxZRVls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X6vyYS7R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X6vyYS7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779343931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ir8DvFtrHJUMzEnN698Oi4cgtFxkYLIAGSzxBXTdkWg=;
	b=X6vyYS7R0rpnKz0nHng8USBZIcXEJY4p/U6ZHnK97fSDX9ousHID2YEnQIqtP0uckMeEnb
	lb9CCFN4YyKgtE9jLgbKbPvQS0xmHvyq0YnPnxDQwRqqVZKUd+I6H+KPrLV3Aimgycl2W5
	XKpZjgMMj+o3kdFsYC2DwQjjpVCyrgM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-2MJkRtpZOHGRzsO-s_ClmA-1; Thu,
 21 May 2026 02:12:10 -0400
X-MC-Unique: 2MJkRtpZOHGRzsO-s_ClmA-1
X-Mimecast-MFC-AGG-ID: 2MJkRtpZOHGRzsO-s_ClmA_1779343929
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D02018002C7
	for <llvm@lists.linux.dev>; Thu, 21 May 2026 06:12:09 +0000 (UTC)
Received: from [172.20.199.238] (unknown [10.30.44.8])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB42C30001A2;
	Thu, 21 May 2026 06:12:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc4,
 upstream-mainline, 8bc67e4d)
Date: Thu, 21 May 2026 06:12:08 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <17419.126052102121000174@us-mta-672.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lWC_S24r7zk2ixbfvdE5tK4LNtaqAwkEVKZqGV-UDqM_1779343929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'erofs-for-7.1-rc5-fixes' of git://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2541515454

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2541515454_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2541515454_x86_64_kernel_kcidb_tool_21324472_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2541515454_x86_64_kernel_kcidb_tool_21324472_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/460



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

