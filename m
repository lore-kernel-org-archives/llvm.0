Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB71CD1FD
	for <llvm@lists.linux.dev>; Sat,  1 Feb 2025 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738444986; cv=none; b=qB8IZAPSmcoCNHugdyYCg4ee09bDSOxQ7fXP/YgSbpSrAUdmRtULvdYnityQo5PIeob2mrOL9mF9q0+l74ZX8dOS4Q+F10aPwwMgMIeBQqlH45ZuSkpTW5vWnA7kO/0oGM3NQaxI13TzR9kY4brR+YqEI5omUQSPMHkOGYgazj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738444986; c=relaxed/simple;
	bh=GqufNL0PykLZKAwtVAmtEAFY9ilgicUl6XreLbDP6LM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=J4aFefDW1Tl8WqGw9bC/Lsn0vuzG+cyiW2fTzRmxIRz5G6aIMcYhjSWFkMYBxXl+2kYCMwd/75p+XJhH4opyJGMBVYJWToNKKgsG9En146Hf7dS09ALo9xNVen7uos+vHL6VzgoNSxyGXnd5agOGPGQa5r1LGPtmPhtFwT/W8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3SMW29r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3SMW29r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738444983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wrbr9v58SAKvxwRbZuMVVx99R3Vt0s/vF45YzU3+kZ0=;
	b=J3SMW29ruO1RSQUgvs2gJD9m1JKdeOFVuud3BUBN3gOrjvWRaHAzcIyBZ2+iOjUE9hWljb
	nOCctOIlXftLcvT/Eda15J4FU7LWF7W7mcWiw1g4OaSJxhPe651koPsv+nFpmDWGV4vRoI
	Tks03u/BEnq8go7IyrHBMuFjWvyY2pI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-h97WbcyoM86M7PQXtpSUFg-1; Sat,
 01 Feb 2025 16:23:02 -0500
X-MC-Unique: h97WbcyoM86M7PQXtpSUFg-1
X-Mimecast-MFC-AGG-ID: h97WbcyoM86M7PQXtpSUFg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5687D1800366
	for <llvm@lists.linux.dev>; Sat,  1 Feb 2025 21:23:01 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E62771800365;
	Sat,  1 Feb 2025 21:23:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, cabb4685)
Date: Sat, 01 Feb 2025 21:23:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <34231.125020116230200231@us-mta-213.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M98TPBlFCaY0xEQ-QgW9UWVVIVpgn576ZmeqYsQ43ys_1738444981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.14-rc-smb3-client-fixes-part2' of git://g=
it.samba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1651636359

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1651636359-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1651636359-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1651636359-x86_64-kernel
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

