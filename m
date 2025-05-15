Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845ED26ACC
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 03:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747280530; cv=none; b=iVUIt4ynA8GDvPw6AH/QSd3XSHNLPOcH+kTz5hLKRyDHbloBs9NfCyMtFQVexBHxQID08SVj+d52ahn1nR1qisFFZfu2IjyThIWTGFf8Rvr3OYwc2XHJPoJw6WfP5skIbXQP3ofTcXpHjH6eQeJYi7MY201Xx6Ia/IfTQGTDYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747280530; c=relaxed/simple;
	bh=qNh2Io36uToDaFqOi0X3TlMM1Vqytv2DoqO/YPbiOKg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DeYLOmsPWr+4deLTk800YwKGCCJ5N2t5YX0oYZDAfXwvCAKoyxN3gBhM3cTlqd4z+2Imc95xUzIvdF8cpoyedAmwTExUNWfFgfkLHKwf2xOotBEPNtJ+xGcM7Zp2MtHwx7mi7DZ74/UL+QXjkhpB6zgm6kSapu0ZQpQBeHuYozc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bzz9Vx3K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bzz9Vx3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747280527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4+4JUVjKWbVEqNCpXij/8soXByOpKWKsLS6xAyirBCM=;
	b=bzz9Vx3KzL+r8fnVKVfWe+zGmQrU/Sbq6BNPOKIoFufDCc28Iprd+jNYBU2WO6AN7M7ALt
	o2lPmXDj2wJS+gb+kzBRCgHxI0rYznyDVBNedZWftG9kuqk3MZSQ8J71tc8y8lSABjfaO7
	9f5g5ipVyVJauCfrXVX3MNJzjp4+Guk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-oqiMd5BqNOqr9mfKgz3Fsg-1; Wed,
 14 May 2025 23:42:06 -0400
X-MC-Unique: oqiMd5BqNOqr9mfKgz3Fsg-1
X-Mimecast-MFC-AGG-ID: oqiMd5BqNOqr9mfKgz3Fsg_1747280525
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 223801800368
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 03:42:05 +0000 (UTC)
Received: from [172.20.90.206] (unknown [10.30.45.71])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A3C4B19560B4;
	Thu, 15 May 2025 03:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 74a63255)
Date: Thu, 15 May 2025 03:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <06509.125051423420600153@us-mta-150.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vZmZv9GCoJC7TdsKksIPhqrp6xmeUbOm0SUMnPVidSw_1747280525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.15-rc6-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1818303539

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1818303539-x86_64-kernel-debug


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

