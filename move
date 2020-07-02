import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Toolkit;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.*;
public class move extends JFrame {
	private final int width = 500;// 窗口的宽度
    private final int height = 500;// 宽口的高度
    private Toolkit took = null;// 将各个组件绑定
    private TextPanel textPanel = null;

    public static void main(final String[] args) {
        new move().show();
    }

    public move() {
        setTitle("移动的小球");
        took = Toolkit.getDefaultToolkit();
        final Dimension dm = took.getScreenSize();// 获取屏幕的 宽度和高度
        final int swidth = (dm.width - this.width) / 2;
        final int sheight = (dm.height - this.height) / 2;
        setLocation(swidth, sheight);// 窗口居于屏幕中间
        setSize(width, height);// 设置窗体的大小
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);// 关闭
        textPanel = new TextPanel(10, 10);// 面板
        add(textPanel);// 添加面板
        addKeyListener(new Keyent());// 添加键盘事件
    }

    // 键盘事件
    class Keyent extends KeyAdapter {
        @Override
        public void keyPressed(final KeyEvent e) {
            if (e.getKeyCode() == KeyEvent.VK_UP) {// 上
                textPanel.y -= 5;
            } else if (e.getKeyCode() == KeyEvent.VK_DOWN) {// 下
                textPanel.y += 5;
            } else if (e.getKeyCode() == KeyEvent.VK_LEFT) {// 左
                textPanel.x -= 5;
            } else if (e.getKeyCode() == KeyEvent.VK_RIGHT) {// 右
                textPanel.x += 5;
            }
            textPanel.repaint();// 重新绘图
        }
    }

    // 继承面板在面板上绘图
    class TextPanel extends JPanel {// 继承面板
        int x;
        int y;

        public TextPanel(final int x, final int y) {
            this.x = x;
            this.y = y;
        }

        public void paint(final Graphics g) {// 在面板上绘图
			super.paint(g);
			g.setColor(Color.black);// 设置画笔的颜色
            g.fillOval(x, y, 20, 20);// 画圆
		}
	}
}
