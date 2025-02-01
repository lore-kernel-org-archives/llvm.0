Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA12F5E
	for <llvm@lists.linux.dev>; Sat,  1 Feb 2025 05:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738387332; cv=none; b=ml4UIMzxpGBaXUOHoyXu/ijzgFhrSJvZqWd/IMlOXmcPmmvZB54z9rcK4AIvhuQ86Z4ZCVqR/hUOck1xoc8U4xN2FLeWCwuqHd87tiKB4ya3AxHrQGSPq/ClS/ykZWxcazhiP57e5ZSfx6cYTPl4u5Rrr9wtYRpu84o0Mr+ptN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738387332; c=relaxed/simple;
	bh=BaT+yG96ZRpkYIBXpil9xHprBNEM0uvbSzrqAbVS5YQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UvOMM5M7KKiDeHA6FIh3uSAsCwGY8j/H7ExnaMepD1InEErn+wUrhSokshqs7uwKhiQd+9hj5KyGrwaEKvyuqOttF6Eer4Ob27BOfvChPX8QZpzFRkN2VaHAxZeK+KH9JkkSH+44hyztppRkpyuAChkbP6D/OvLowKWgynJ6QKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2S8Mp6a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2S8Mp6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738387329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OwwLD2gou6lflXeD9tW+VWxuU8XrP9f+Z67EwcAhIa8=;
	b=D2S8Mp6arVx1sqd9CvmpeigYQYDa7G0n2TUlrkqRgXS3TOzv3vknNeGy+++wTISm6BtpFH
	/r3DOJv28gnQpvHf5o6ClDSxqzOtxcfLytfL71eomd2JjREYF2PwtGxO/eNyvLv3ruX79b
	elGZkDXR0g92TnCOMqlAPTrg/gdGMU0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-604-Gz-CkzVOMeuKS4_6sCmoOQ-1; Sat,
 01 Feb 2025 00:22:06 -0500
X-MC-Unique: Gz-CkzVOMeuKS4_6sCmoOQ-1
X-Mimecast-MFC-AGG-ID: Gz-CkzVOMeuKS4_6sCmoOQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF7C4195608A
	for <llvm@lists.linux.dev>; Sat,  1 Feb 2025 05:22:05 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B4E619560A3;
	Sat,  1 Feb 2025 05:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 04a3389b)
Date: Sat, 01 Feb 2025 05:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <39330.125020100220600714@us-mta-604.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oEqjo5dVyugPmPwjNhuAaknaO3LWAPKmUbf3pi1KgRY_1738387326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Remove stale generated 'genheaders' file

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1651199928

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1651199928-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1651199928-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1651199928-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

